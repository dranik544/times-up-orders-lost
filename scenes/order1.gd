extends Node2D
# Order.gd

# Основные элементы интерфейса (они статичны)
onready var bg = $bg
onready var shadow = $shadow
onready var ui = $ui
onready var message = $ui/message
onready var name_label = $"ui/message/name money/name"
onready var money_label = $"ui/message/name money/money"
onready var desc_label = $ui/message/desc
onready var time_progress_bar = $ui/message/time
onready var blocks_container = $ui/blocks
onready var ready_button = $ui/ready
onready var cancel_button = $ui/cancel
onready var sepr_1 = $ui/message/sepr1
onready var sepr_2 = $ui/sepr2
onready var sepr_3 = $ui/sepr3
onready var sepr_4 = $ui/sepr4
onready var canvas_modulate = $"../../CanvasModulate"
onready var sounds = $"sounds"
onready var rare_particles = $rareParticles
onready var tags_label = $ui/tags
onready var main: Node2D = get_tree().current_scene

onready var time = $time
onready var tween_complete_order = $TweenCompleteOrder

var basePosition: Vector2 = position
var param_widgets: Array = []  # каждый элемент: словарь с типом, виджетом и ожидаемыми значениями
var random_order: Dictionary
var isCompleted: bool = false
var is_dragging = false
var drag_offset = Vector2()   # смещение между центром заказа и курсором
export var currentTypeOrder = -1
var tags: Array = []

func _ready():
	add_to_group("order")
	
	yield(get_tree().create_timer(0.05, false), "timeout")
	
	ui.connect("gui_input", self, "_on_ui_gui_input")
	message.connect("gui_input", self, "_on_ui_gui_input")
	
	randomize()
	
	if currentTypeOrder == Global.typeOrder.START:
		random_order = OrderGenerator.generate_start_order()
	elif currentTypeOrder == Global.typeOrder.BEGIN:
		random_order = OrderGenerator.generate_order_by_type(6)  # если есть BEGIN
	elif currentTypeOrder == Global.typeOrder.CUSTOM:
		random_order = OrderList.customOrder   # если остался кастомный
	elif currentTypeOrder == Global.typeOrder.RARE:
		random_order = OrderGenerator.generate_order_by_type(2)
	elif currentTypeOrder == Global.typeOrder.MESSAGE:
		random_order = OrderGenerator.generate_order_by_type(5)
	elif currentTypeOrder == Global.typeOrder.EMERGENCY:
		random_order = OrderGenerator.generate_order_by_type(3)
	elif currentTypeOrder == Global.typeOrder.DARKNET:
		random_order = OrderGenerator.generate_order_by_type(4)
	else:
		random_order = OrderGenerator.generate_order()
	
	# Если заказ пустой — выходим
	if random_order.empty():
		print("Ошибка: не удалось сгенерировать заказ")
		queue_free()
		return
	
	currentTypeOrder = random_order["type"]
	
	random_order["time"] *= Global.timeToCompleteOrderMod
	print("Время на выполнение заказа: " + str(random_order["time"]))
	
	print("Тип этого заказа: " + str(currentTypeOrder))
	if currentTypeOrder != Global.typeOrder.START && currentTypeOrder != Global.typeOrder.BEGIN:
		random_order["prms"].shuffle()
	
	# Заполняем статическую информацию
	name_label.text = random_order["name"]
	desc_label.bbcode_text = random_order["desc"]
	time_progress_bar.max_value = random_order["time"]
	time_progress_bar.value = random_order["time"]
	time.wait_time = random_order["time"]
	money_label.text = str(random_order["money"]) + "$"
	
	if random_order.has("ready text"):
		ready_button.text = random_order["ready text"]
	else: ready_button.text = "READY"
	if random_order.has("cancel text"):
		cancel_button.text = random_order["cancel text"]
	else: cancel_button.text = "CANCEL"
	
	if currentTypeOrder == Global.typeOrder.RARE:
		rare_particles.restart()
		bg.texture = load("res://sprites/orderBG2_rare.png")
	if currentTypeOrder == Global.typeOrder.START || currentTypeOrder == Global.typeOrder.BEGIN:
		bg.texture = load("res://sprites/orderBG2_start.png")
	if currentTypeOrder == Global.typeOrder.MESSAGE:
		bg.texture = load("res://sprites/orderBG2_message.png")
	if currentTypeOrder == Global.typeOrder.EMERGENCY:
		bg.texture = load("res://sprites/orderBG2_emergency.png")
		_play_sound(load("res://sounds/EMERGENCY ORDER.mp3"))
		main.get_node("bg")._shake_camera(0.5, 150)
		canvas_modulate._flash(Color.red, 45.0)
	if currentTypeOrder == Global.typeOrder.DARKNET:
		bg.texture = load("res://sprites/orderBG2_darknet_2.png")
		main.get_node("CanvasLayer/shading1")._flash()
	
	if random_order.has("mods"):
		var m = random_order["mods"]
		if m.has("safe cancel"):
			tags.append("Безопасный отказ")
		if m.has("safe skip"):
			tags.append("Безопасный пропуск")
		if m.has("safe rep"):
			tags.append("Без отзыва")
		if m.has("disable cancel"):
			cancel_button.hide()
			tags.append("Нет отмены")
		if m.has("police count"):
			tags.append("+" + str(m["police count"]) + " к преступности")
		if m.has("multiple review"):
			tags.append("Сразу " + str(m["multiple review"]) + " отзывов")
	if tags.empty():
		tags_label.hide()
		sepr_4.hide()
	else:
		for i in tags:
			tags_label.text += i + "\n"
	
	# Обнуляем массив параметров
	param_widgets.clear()
	
	# Создаём виджеты для каждого параметра
	for p in random_order["prms"]:
		match p["type"]:
			"check":
				var cb = CheckBox.new()
				cb.text = p["text"]
				randomize()
				cb.pressed = true if randi()%2 == 1 else false
				cb.align = Button.ALIGN_CENTER
				cb.rect_min_size.x = 200
				blocks_container.add_child(cb)
				# Принудительно приводим expected к bool
				var expc = p["stat"]
				
				print(expc)
				
				if typeof(expc) == TYPE_STRING:
					expc = expc.to_lower() == "true"
				else:
					expc = bool(expc)  # на случай других типов
				
				print(expc)
				
				param_widgets.append({
					"type": "check",
					"widget": cb,
					"expected": expc
				})
				
			"option":
				var hbox = HBoxContainer.new()
				var label = Label.new()
				label.text = p["text"] + ":"
				hbox.add_child(label)
				var opt = OptionButton.new()
				for item in p["items"]:
					opt.add_item(item)
				hbox.add_child(opt)
				opt.rect_min_size.x = 200
				opt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
				opt.selected = rand_range(0, p["items"].size() - 1)
				blocks_container.add_child(hbox)
				param_widgets.append({
					"type": "option",
					"widget": opt,
					"expected": p["indx"]
				})
				
			"slider":
				var hbox = HBoxContainer.new()
				var label = Label.new()
				label.text = p["text"] + ":"
				hbox.add_child(label)
				var slider = HSlider.new()
				slider.size_flags_horizontal = Control.SIZE_EXPAND_FILL
				slider.rect_min_size.x = 200
				slider.min_value = p["min value"]
				slider.max_value = p["max value"]
				slider.step = p["step"]
				slider.value = rand_range(p["min value"], p["max value"])
				var val_label = Label.new()
				val_label.text = str(slider.value)
				hbox.add_child(slider)
				hbox.add_child(val_label)
				blocks_container.add_child(hbox)
				var widget_data = {
					"type": "slider",
					"widget": slider,
					"val_label": val_label,
					"expected_min": p["min d value"],
					"expected_max": p["max d value"]
				}
				param_widgets.append(widget_data)
				slider.connect("value_changed", self, "_on_slider_value_changed", [val_label])
			
			"line":
				var hbox = HBoxContainer.new()
				var label = Label.new()
				label.text = p["text"] + ":"
				hbox.add_child(label)
				var le = LineEdit.new()
				le.size_flags_horizontal = Control.SIZE_EXPAND_FILL
				le.rect_min_size.x = 200
				le.context_menu_enabled = false
				le.caret_blink = true
				le.clear_button_enabled = true
				le.placeholder_alpha = 0.4
				le.placeholder_text = p["ph text"]
				if Global.upOrderIfLineEditFocusEntered:
					le.connect("focus_entered", self, "_on_line_edit_focus_entered", [le])
					le.connect("focus_exited", self, "_on_line_edit_focus_exited")
				hbox.add_child(le)
				blocks_container.add_child(hbox)
				var widget_data = {
					"type": "line",
					"widget": le,
					"expected": p["correct"]
				}
				param_widgets.append(widget_data)
	
	# Обновляем размер фона
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	
	bg.rect_size = ui.get_combined_minimum_size() + Vector2(6, 6)
	shadow.rect_size = ui.get_combined_minimum_size() + Vector2(6, 6)
	if currentTypeOrder == Global.typeOrder.RARE:
		rare_particles.emission_rect_extents = ui.get_combined_minimum_size() + Vector2(6, 6) - (ui.get_combined_minimum_size() + Vector2(6, 6)) / 2
		rare_particles.position = ui.get_combined_minimum_size() + Vector2(6, 6) - (ui.get_combined_minimum_size() + Vector2(6, 6)) / 2
	
	# Анимация появления заказа
	scale.y = 0.0
	if currentTypeOrder != Global.typeOrder.EMERGENCY: _play_sound(load("res://sounds/whatsapp.mp3"))
	yield(_show_with_animation(), "completed")
	
	# Делаем анимацию утекающего времени
	var tween = create_tween()
	tween.tween_property(time_progress_bar, "value", 0, random_order["time"])
	tween.play()
	
	# Стартуем время выполнения заказа
	time.connect("timeout", self, "_on_time_timeout")
	time.start()
	
	# Подключаем кнопки
	ready_button.connect("pressed", self, "_on_ready_pressed")
	cancel_button.connect("pressed", self, "_on_cancel_pressed")

func _on_ui_gui_input(event):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		if event.pressed:
			# Начинаем перетаскивание
			is_dragging = true
			# Вычисляем смещение от позиции заказа до курсора
			var mouse_global = get_global_mouse_position()
			drag_offset = basePosition - mouse_global
		else:
			# Заканчиваем перетаскивание
			is_dragging = false
	
	if event is InputEventMouseMotion && is_dragging:
		# Перемещаем заказ
		var mouse_global = get_global_mouse_position()
		basePosition = mouse_global + drag_offset

func _process(delta):
	# Лёгкое смещение от мыши (экранные координаты)
	var offset: Vector2
	if Global.system == 0:
		offset = (get_viewport().get_mouse_position() - get_viewport().get_visible_rect().size / 2) * 0.03 if !is_dragging else Vector2(-16.0, -16.0)
	else:
		offset = Vector2.ZERO if !is_dragging else Vector2(-16.0, -16.0)
	var shadowOffset = Vector2(4.0, 4.0) if !is_dragging else Vector2(12.0, 12.0)
	position = lerp(position, basePosition + offset, 40 * delta)
	shadow.rect_position = lerp(shadow.rect_position, shadowOffset, 40 * delta)

func _on_time_timeout():
	if random_order.get("tags", -1) != -1:
		Global.decrease_weight(random_order.get("tags", -1))
	
	if random_order.has("mods") and random_order["mods"].has("safe skip"):
		if isCompleted: return
	else: if isCompleted: return
	
	remove_from_group("order")
	
	Global._auto_balance(false)
	
	canvas_modulate._flash(Color.coral)
	main.get_node("bg")._shake_camera(5.0, 75.0)
	yield(_show_review(false), "completed")
	_try_spawn_order()
	
	queue_free()

func _on_line_edit_focus_entered(line_edit: LineEdit):
	# Только для мобильных устройств
	if Global.upOrderIfLineEditFocusEntered:
		# Запоминаем исходную позицию, если ещё не запомнили
		if not has_meta("original_base_position"):
			set_meta("original_base_position", basePosition)
		# Если поле ниже середины экрана, поднимаем на разницу
		var offset_y = max(0, line_edit.get_global_position().y - get_viewport().get_visible_rect().size.y * 0.4)
		basePosition.y -= offset_y
		basePosition = get_meta("original_base_position") - Vector2(0, offset_y)

func _on_line_edit_focus_exited():
	# Возвращаем окно на место, когда фокус потерян
	if Global.upOrderIfLineEditFocusEntered && has_meta("original_base_position"):
		basePosition = get_meta("original_base_position")
		remove_meta("original_base_position")

# Обновление лейбла при движении слайдера
func _on_slider_value_changed(value, val_label):
	val_label.text = str(value)

# Обработчик кнопки Ready
func _on_ready_pressed():
	isCompleted = true
	time.stop()
	
	var all_ok = true
	for data in param_widgets:
		match data["type"]:
			"check":
				var expected = data["expected"]
				if typeof(expected) == TYPE_STRING:
					expected = expected.to_lower() == "true"
				var user_value = data["widget"].pressed
				print("Check: user=", user_value, " expected=", expected)
				if user_value != expected:
					all_ok = false
					break
			"option":
				var expected = data["expected"]
				if typeof(expected) == TYPE_STRING:
					expected = int(expected) if expected.is_valid_integer() else 0
				if data["widget"].selected != expected:
					all_ok = false
					break
			"slider":
				var val = data["widget"].value
				if val < data["expected_min"] or val > data["expected_max"]:
					all_ok = false
					break
			"line":
				if data["widget"].text.to_lower() != data["expected"].to_lower():
					all_ok = false
					break
	
	if all_ok:
		print("pass (все верно)")
		
		Global._auto_balance(true)
		
		remove_from_group("order")
		
		if random_order.has("mods") and random_order["mods"].has("police count"):
			Global._change_police_count(random_order["mods"]["police count"])
		
		Global._change_completed_orders_count(1)
		
		if random_order.get("tags", -1) != -1:
			Global.update_weights(random_order.get("tags", -1))
		
		canvas_modulate._flash(Color.green)
		_play_sound(load("res://sounds/succesfly.mp3"))
		yield(_show_review(true), "completed")
		
		Global._change_money_count(random_order["money"])
		yield(_play_sound(load("res://sounds/money.mp3")), "completed")
	else:
		print("pass (не все верно)")
		
		Global._auto_balance(false)
		
		remove_from_group("order")
		
		if random_order.has("mods") and random_order["mods"].has("police count"):
			Global._change_police_count(random_order["mods"]["police count"])
		
		if random_order.get("tags", -1) != -1:
			Global.decrease_weight(random_order.get("tags", -1))
		
		money_label.text = str(random_order["money"] / 2) + "$"
		canvas_modulate._flash(Color.crimson)
		_play_sound(load("res://sounds/damage.mp3"))
		main.get_node("bg")._shake_camera()
		
		yield(_show_review(false), "completed")
		
		Global._change_money_count(random_order["money"] / 2)
		yield(_play_sound(load("res://sounds/money.mp3")), "completed")
		
	
	_try_spawn_order()
	queue_free()


# Обработчик кнопки Cancel
func _on_cancel_pressed():
	if !random_order.has("mods") || random_order.has("mods") && random_order["mods"].has("safe cancel"):
		if Global.canceledOrders >= Global.MAX_CANCELED_ORDERS: return
	
	isCompleted = true
	time.stop()
	
	remove_from_group("order")
	if !random_order.has("mods") || random_order.has("mods") && !random_order["mods"].has("safe cancel"):
		Global._change_canceled_orders_count(1)
	yield(_hide_with_animation(), "completed")
	_try_spawn_order()
	
	queue_free()

func _hide_with_animation():
	tween_complete_order.interpolate_property(self, "scale:y", self.scale.y, 0.0, 0.5, Tween.TRANS_BACK, Tween.EASE_IN)
	tween_complete_order.start()
	yield(tween_complete_order, "tween_completed")
	
	return true

func _show_with_animation():
	tween_complete_order.interpolate_property(self, "scale:y", self.scale.y, 1.0, 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween_complete_order.start()
	yield(tween_complete_order, "tween_completed")
	
	return true

func _show_review(good: bool):
	ui.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	yield(_hide_with_animation(), "completed")
	
	desc_label.bbcode_text = random_order["good review"] if good else random_order["bad review"]
	
	var o: int = 1
	if random_order.has("mods") && random_order["mods"].has("multiple review"):
		o = random_order["mods"]["multiple review"]
	for i in range(o):
		if !random_order.has("mods") || random_order.has("mods") && !random_order["mods"].has("safe rep"):
			Global._add_review(
				5.0 if good else 1.0
			)
	
	ready_button.hide()
	cancel_button.hide()
	blocks_container.hide()
	sepr_2.hide(); sepr_3.hide()
	time_progress_bar.hide()
	yield(get_tree(), "idle_frame")
	bg.rect_size = ui.get_combined_minimum_size() + Vector2(6, 6)
	shadow.rect_size = ui.get_combined_minimum_size() + Vector2(6, 6)
	
	yield(_show_with_animation(), "completed")
	
	yield(get_tree().create_timer(5.0), "timeout")
	
	yield(_hide_with_animation(), "completed")
	
	return true

func _try_spawn_order():
	if get_tree().get_nodes_in_group("order").size() < Global.maxCountOrdersOnScreen:
		main._spawn_order()

func _play_sound(sound: AudioStreamMP3):
	sounds.stream.audio_stream = sound
	
	sounds.play()
	yield(sounds, "finished")
	
	return true
