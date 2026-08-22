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

func generate_begin_order() -> Dictionary:
	return generate_order_by_type(5)

# ------------------------------------------------------------
# Выбор шаблона (без изменений)
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
		if Global.allContentAtStart:
			if otype == 1 or otype == 5:
				continue
			candidates.append(order)
			continue
		if otype == null or otype == 0 or otype == 3 or otype == 7:
			candidates.append(order)
		elif otype == 1 or otype == 5:
			continue
		elif otype == 2 and completed >= 5:
			candidates.append(order)
		elif otype == 6 and completed >= 15:
			candidates.append(order)
		elif otype == 4 and completed >= 25:
			candidates.append(order)
		else:
			pass

	if candidates.empty():
		for order in OrderList.orders:
			if order.get("type", null) == null:
				candidates.append(order)

	if candidates.empty():
		for order in OrderList.orders:
			var otype = order.get("type", null)
			if otype != 1 and otype != 6:
				candidates.append(order)

	if candidates.empty():
		print("OrderGenerator: НЕТ ДОСТУПНЫХ ЗАКАЗОВ! Возвращаю fallback.")
		return {}

	return candidates[randi() % candidates.size()]

func _find_template_by_type(type_id: int) -> Dictionary:
	for order in OrderList.orders:
		if order.get("type", null) == type_id:
			return order
	return {}

# ------------------------------------------------------------
# Основная логика обработки шаблона (плоская структура)
# ------------------------------------------------------------
func _process_template(template: Dictionary) -> Dictionary:
	var order = template.duplicate(true)

	# 1. Генерация глобальных значений (если есть)
	var global_generated = {}
	if order.has("frmt"):
		global_generated = _generate_frmt_values(order["frmt"])
		order.erase("frmt")

	# 2. Подстановка глобальных значений в desc
	if order.has("desc"):
		order["desc"] = _format_text(order["desc"], global_generated)

	# 3. Обработка каждого параметра
	var new_prms = []
	for param in order.get("prms", []):
		var new_param = param.duplicate()

		# Генерация локальных значений (если есть frmt внутри параметра)
		var local_generated = {}
		if new_param.has("frmt"):
			local_generated = _generate_frmt_values(new_param["frmt"])
			new_param.erase("frmt")

		# Объединяем глобальные и локальные для подстановки
		var all_generated = {}
		for key in global_generated:
			all_generated[key] = global_generated[key]
		for key in local_generated:
			all_generated[key] = local_generated[key]

		# Подстановка значений во все строковые поля параметра
		for field in new_param.keys():
			if typeof(new_param[field]) == TYPE_STRING:
				new_param[field] = _format_text(new_param[field], all_generated)

		# Преобразование числовых полей (если стали строками)
		var numeric_fields = ["min value", "max value", "step", "min d value", "max d value", "indx"]
		for field in numeric_fields:
			if new_param.has(field) and typeof(new_param[field]) == TYPE_STRING:
				if new_param[field].is_valid_integer():
					new_param[field] = int(new_param[field])
				elif new_param[field].is_valid_float():
					new_param[field] = float(new_param[field])

		# Преобразование stat в булево (если строка)
		if new_param.has("stat") and typeof(new_param["stat"]) == TYPE_STRING:
			new_param["stat"] = new_param["stat"].to_lower() == "true"

		new_prms.append(new_param)

	order["prms"] = new_prms
	return order

# ------------------------------------------------------------
# Вспомогательные функции
# ------------------------------------------------------------
func _generate_frmt_values(frmt: Dictionary) -> Dictionary:
	var result = {}
	for key in frmt:
		var value = _generate_value(frmt[key])
		# Если это rand_option, раскладываем на два ключа
		if typeof(value) == TYPE_DICTIONARY and value.has("text") and value.has("index"):
			result[key + "_text"] = value["text"]
			result[key + "_index"] = value["index"]
		else:
			result[key] = value
	return result

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
		"rand_option":
			var pool = spec.get("pool", ["default"])
			var idx = randi() % pool.size()
			return {"text": pool[idx], "index": idx}
		_:
			return spec

func _format_text(text: String, generated: Dictionary) -> String:
	for key in generated:
		var value = generated[key]
		# Для булевых значений выводим ДА/НЕТ в текст
		if typeof(value) == TYPE_BOOL:
			value = "ДА" if value else "НЕТ"
		text = text.replace("{" + key + "}", str(value))
	return text

# ------------------------------------------------------------
# Запасной вариант
# ------------------------------------------------------------
func _fallback_order() -> Dictionary:
	return {
		"name": "Ошибка",
		"desc": "/n[center][b][wave]Ошибка генерации[/wave][/b][/center]",
		"good review": "...",
		"bad review": "...",
		"time": 5,
		"money": 0,
		"ready text": "OK",
		"cancel text": "Отмена",
		"tags": -1,
		"type": null,
		"mods": {"safe skip": true, "safe rep": true},
		"prms": []
	}
