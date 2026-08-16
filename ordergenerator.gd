extends Node

# ------------------------------------------------------------
# Публичные методы
# ------------------------------------------------------------
func generate_order() -> Dictionary:
	var template = _pick_template()
	if template.empty():
		return _fallback_order()
	return _process_template(template)

func generate_order_by_type(type_id: int) -> Dictionary:
	var template = _find_template_by_type(type_id)
	if template.empty():
		return _fallback_order()
	return _process_template(template)

func generate_start_order() -> Dictionary:
	return generate_order_by_type(1)

# ------------------------------------------------------------
# Выбор шаблона (как было, без изменений)
# ------------------------------------------------------------
func _pick_template() -> Dictionary:
	var chosen_tag = Global.get_weighted_tag()
	var candidates = []
	var completed = Global.completedOrders
	
	for order in OrderList.orders:
		var tags = order.get("tags", -1)
		if tags != chosen_tag:
			continue
	
		var otype = order.get("type", null)
		match otype:
			null, 0, 3, 7:   # DEFAULT, MESSAGE, CUSTOM — всегда доступны
				candidates.append(order)
			1:               # START — не спавним в обычной генерации
				continue
			6:               # BEGIN — только по принудительному вызову
				continue
			2:               # RARE — после 7
				if completed >= 7:
					candidates.append(order)
			4:               # EMERGENCY — после 35
				if completed >= 35:
					candidates.append(order)
			5:               # DARKNET — после 20
				if completed >= 20:
					candidates.append(order)
			_:
				pass  # неизвестный тип — игнорируем
	
	if candidates.empty():
		for order in OrderList.orders:
			if order.get("type", null) in [null, 0, 3, 7]:
				candidates.append(order)
	
	if candidates.empty():
		return {}
	
	return candidates[randi() % candidates.size()]

func _find_template_by_type(type_id: int) -> Dictionary:
	for order in OrderList.orders:
		if order.get("type", null) == type_id:
			return order
	return {}

# ------------------------------------------------------------
# Основная логика обработки шаблона
# ------------------------------------------------------------
func _process_template(template: Dictionary) -> Dictionary:
	# Копируем основные поля
	var result = {
		"name": template.get("name", "Unknown"),
		"good review": template.get("good review", ""),
		"bad review": template.get("bad review", ""),
		"time": template.get("time", 60),
		"money": template.get("money", 0),
		"ready text": template.get("ready text", "ГОТОВО"),
		"cancel text": template.get("cancel text", "ОТМЕНА"),
		"tags": template.get("tags", -1),
		"type": template.get("type", null),
		"prms": []
	}
	if template.has("mods"):
		result["mods"] = template["mods"].duplicate()

	# Если есть группы — обрабатываем их
	var groups = template.get("groups", [])
	if groups.empty():
		# Старый формат без групп
		result["desc"] = template.get("desc", "")
		result["prms"] = template.get("prms", []).duplicate()
		return result

	# Выбираем от 1 до min(4, количество групп) случайных групп
	var max_groups: int = groups.size()
	
	max_groups = clamp(max_groups, Global.minCountGroupsInOrder, Global.maxCountGroupsInOrder)
	
	var count: int = randi() % max_groups + 1
	var selected = groups.duplicate()
	selected.shuffle()
	selected = selected.slice(0, count)

	var flat_prms = []
	var group_texts = []

	for group in selected:
		var generated = {}
		if group.has("frmt"):
			for key in group["frmt"]:
				var value = _generate_value(group["frmt"][key])
				# Если это rand_option, раскладываем на два ключа
				if typeof(value) == TYPE_DICTIONARY and value.has("text") and value.has("index"):
					generated[key + "_text"] = value["text"]
					generated[key + "_index"] = value["index"]
				else:
					generated[key] = value

		# Формируем текст группы с подстановкой значений (ДА/НЕТ для булевых)
		var group_desc = group.get("desc", "")
		for key in generated:
			group_desc = group_desc.replace("{" + key + "}", _format_value_for_text(generated[key]))
		group_texts.append(group_desc)

		# Обрабатываем блоки параметров
		for block in group.get("blck", []):
			var b = block.duplicate()
			# Подставляем значения во все строковые поля блока
			for field in b.keys():
				if typeof(b[field]) == TYPE_STRING:
					for key in generated:
						b[field] = b[field].replace("{" + key + "}", _format_value_for_text(generated[key]))
			# Преобразуем числовые поля, если они стали строками
			var numeric_fields = ["min value", "max value", "step", "min d value", "max d value", "indx"]
			for field in numeric_fields:
				if b.has(field) and typeof(b[field]) == TYPE_STRING:
					if b[field].is_valid_integer():
						b[field] = int(b[field])
					elif b[field].is_valid_float():
						b[field] = float(b[field])
			# Преобразуем булево поле stat
			if b.has("stat") and typeof(b["stat"]) == TYPE_STRING:
				b["stat"] = b["stat"].to_lower() == "true"
			flat_prms.append(b)

	result["prms"] = flat_prms

	# Сборка общего desc
	var base_desc = template.get("desc", "")
	if base_desc.empty():
		var new_desc = "[center][b]ЗАКАЗ[/b][/center]\n"
		for t in group_texts:
			new_desc += str(t) + "\n"
		result["desc"] = new_desc
	else:
		var extra = ""
		for t in group_texts:
			extra += str(t) + "\n"
		if not extra.empty():
			result["desc"] = base_desc + "\n" + extra
		else:
			result["desc"] = base_desc

	return result

# ------------------------------------------------------------
# Генерация одного значения по спецификации
# ------------------------------------------------------------
func _generate_value(spec):
	if typeof(spec) != TYPE_DICTIONARY or not spec.has("type"):
		return spec

	var type = spec["type"]
	match type:
		"rand_int":
			var min_val = spec.get("min", 0)
			var max_val = spec.get("max", 10)
			return randi() % (max_val - min_val + 1) + min_val
		"rand_bool":
			return randi() % 2 == 1
		"rand_text":
			var pool = spec.get("pool", ["default"])
			return pool[randi() % pool.size()]
		"rand_option":   # <-- новый тип
			var pool = spec.get("pool", ["default"])
			var idx = randi() % pool.size()
			# Возвращаем словарь с двумя полями
			return {
				"text": pool[idx],
				"index": idx
			}
		_:
			return spec

func _format_value_for_text(value) -> String:
	if typeof(value) == TYPE_BOOL:
		return "ДА" if value else "НЕТ"
	else:
		return str(value)

# ------------------------------------------------------------
# Запасной вариант
# ------------------------------------------------------------
func _fallback_order() -> Dictionary:
	return {
		"name": "Ошибка",
		"desc": "[center][b]Ошибка генерации[/b][/center]",
		"good review": "...",
		"bad review": "...",
		"time": 5,
		"money": 0,
		"ready text": "OK",
		"cancel text": "Отмена",
		"tags": -1,
		"type": null,
		"prms": []
	}
