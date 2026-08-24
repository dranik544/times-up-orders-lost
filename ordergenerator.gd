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
	var generated = {}
	if order.has("frmt"):
		generated = _generate_frmt_values(order["frmt"])
		order.erase("frmt")

	# 2. Подстановка значений в desc (с преобразованием ДА/НЕТ для булевых)
	if order.has("desc"):
		order["desc"] = _format_text(order["desc"], generated)

	# 3. Обработка каждого параметра
	var new_prms = []
	for param in order.get("prms", []):
		var new_param = param.duplicate()

		# Подставляем сгенерированные значения во все строковые поля параметра, КРОМЕ stat
		for field in new_param.keys():
			if typeof(new_param[field]) == TYPE_STRING and field != "stat":
				new_param[field] = _format_text(new_param[field], generated)

		# Отдельно подставляем значения в stat (сырые, без ДА/НЕТ)
		if new_param.has("stat") and typeof(new_param["stat"]) == TYPE_STRING:
			for key in generated:
				new_param["stat"] = new_param["stat"].replace("{" + key + "}", str(generated[key]))
			# Преобразуем строку "true"/"false" в булево
			new_param["stat"] = new_param["stat"].to_lower() == "true"

		# Преобразуем числовые поля (если стали строками)
		var numeric_fields = ["min value", "max value", "step", "min d value", "max d value", "indx"]
		for field in numeric_fields:
			if new_param.has(field) and typeof(new_param[field]) == TYPE_STRING:
				if new_param[field].is_valid_integer():
					new_param[field] = int(new_param[field])
				elif new_param[field].is_valid_float():
					new_param[field] = float(new_param[field])

		new_prms.append(new_param)

	order["prms"] = new_prms
	return order

# ------------------------------------------------------------
# Генерация значений из frmt
# ------------------------------------------------------------
func _generate_frmt_values(frmt: Dictionary) -> Dictionary:
	var result = {}
	for key in frmt:
		var value = _generate_value(frmt[key])
		# Для rand_option: ключ без суффикса — текст, ключ + "_index" — индекс
		if typeof(value) == TYPE_DICTIONARY and value.has("text") and value.has("index"):
			result[key] = value["text"]
			result[key + "_index"] = value["index"]
		else:
			result[key] = value
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
			var step = spec.get("step", 1)
			var count = floor((max_val - min_val) / step) + 1
			var idx = randi() % int(count)
			return min_val + idx * step
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

# ------------------------------------------------------------
# Форматирование текста с плейсхолдерами (замена {ключ} на значение)
# ------------------------------------------------------------
func _format_text(text: String, generated: Dictionary) -> String:
	for key in generated:
		var value = generated[key]
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
