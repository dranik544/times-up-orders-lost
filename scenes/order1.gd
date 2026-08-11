extends Node2D

# Основные элементы интерфейса (они статичны)
onready var bg = $bg
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
onready var canvas_modulate = $"../CanvasModulate"
onready var sounds = $"sounds"
onready var rare_particles = $rareParticles
onready var tags_label = $ui/tags
onready var main: Node2D = get_tree().current_scene

onready var time = $time
onready var tween_complete_order = $TweenCompleteOrder

var param_widgets: Array = []  # каждый элемент: словарь с типом, виджетом и ожидаемыми значениями
var random_order: Dictionary
var isCompleted: bool = false
var is_dragging = false
var drag_offset = Vector2()   # смещение между центром заказа и курсором
enum typeOrder {DEFAULT, START, RARE, MESSAGE, EMERGENCY, BEGIN, DARKNET, CUSTOM}
export var currentTypeOrder = -1
var tags: Array = []

func _ready():
	add_to_group("order")
	
	yield(get_tree().create_timer(0.05, false), "timeout")
	
	ui.connect("gui_input", self, "_on_ui_gui_input")
	message.connect("gui_input", self, "_on_ui_gui_input")
	
	randomize()
	
	# Если это стартовый заказ
	if currentTypeOrder == typeOrder.START:
		random_order = OrderList.startOrder
	elif currentTypeOrder == typeOrder.BEGIN:
		random_order = OrderList.beginOrder
	elif currentTypeOrder == typeOrder.CUSTOM:
		random_order = OrderList.customOrder
	else:
		# 1. Выбираем тег (1, 2 или 3) с учётом весов
		var chosen_tag: int = Global.get_weighted_tag()
		
		# 2. Собираем все заказы из всех списков, у которых tags == chosen_tag
		var candidates = []
		for i in OrderList.orders:
			if i.get("tags", -1) == chosen_tag:
				candidates.append(i)
		for i in OrderList.messageOrders:
			if i.get("tags", -1) == chosen_tag:
				candidates.append(i)
		
		if Global.completedOrders >= 7:
			for i in OrderList.rareOrders:
				if i.get("tags", -1) == chosen_tag:
					candidates.append(i)
		
		if Global.completedOrders >= 20:
			for i in OrderList.darknetOrders:
				if i.get("tags", -1) == chosen_tag:
					candidates.append(i)
		
		if Global.completedOrders >= 35:
			for i in OrderList.emergencyOrders:
				if i.get("tags", -1) == chosen_tag:
					candidates.append(i)
		
		# 3. Если подходящих нет — берём любой из DEFAULT (или fallback)
		if candidates.empty():
			if not OrderList.orders.empty():
				candidates = OrderList.orders
			else:
				print("Нет доступных заказов")
				return
		
		# 4. Выбираем случайный заказ
		randomize()
		random_order = candidates[randi() % candidates.size()]
		
		# 5. ОПРЕДЕЛЯЕМ ТИП ЗАКАЗА ПО ТОМУ, В КАКОМ СПИСКЕ ОН ЛЕЖИТ
		if random_order in OrderList.emergencyOrders:
			currentTypeOrder = typeOrder.EMERGENCY
		elif random_order in OrderList.rareOrders:
			currentTypeOrder = typeOrder.RARE
		elif random_order in OrderList.messageOrders:
			currentTypeOrder = typeOrder.MESSAGE
		elif random_order in OrderList.darknetOrders:
			currentTypeOrder = typeOrder.DARKNET
		else:
			currentTypeOrder = typeOrder.DEFAULT
	
	random_order["time"] *= Global.timeToCompleteOrderMod
	print("Время на выполнение заказа: " + str(random_order["time"]))
	
	print("Тип этого заказа: " + str(currentTypeOrder))
	if currentTypeOrder != typeOrder.START && currentTypeOrder != typeOrder.BEGIN:
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
	
	if currentTypeOrder == typeOrder.RARE:
		rare_particles.restart()
		bg.texture = load("res://sprites/orderBG2_rare.png")
	if currentTypeOrder == typeOrder.START || currentTypeOrder == typeOrder.BEGIN:
		bg.texture = load("res://sprites/orderBG2_start.png")
	if currentTypeOrder == typeOrder.MESSAGE:
		bg.texture = load("res://sprites/orderBG2_message.png")
	if currentTypeOrder == typeOrder.EMERGENCY:
		bg.texture = load("res://sprites/orderBG2_emergency.png")
		_play_sound(load("res://sounds/EMERGENCY ORDER.mp3"))
		get_tree().get_first_node_in_group("camera")._shake_camera(0.5, 150)
		canvas_modulate._flash(Color.red, 45.0)
	if currentTypeOrder == typeOrder.DARKNET:
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
				blocks_container.add_child(cb)
				param_widgets.append({
					"type": "check",
					"widget": cb,
					"expected": p["stat"]
				})
				
			"option":
				# Создаём HBox с подписью и OptionButton
				var hbox = HBoxContainer.new()
				var label = Label.new()
				label.text = p["text"] + ":"
				hbox.add_child(label)
				var opt = OptionButton.new()
				for item in p["items"]:
					opt.add_item(item)
				hbox.add_child(opt)
				opt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
				opt.selected = rand_range(0, p["items"].size() - 1)
				blocks_container.add_child(hbox)
				param_widgets.append({
					"type": "option",
					"widget": opt,
					"expected": p["indx"]
				})
				
			"slider":
				# Создаём HBox с подписью, слайдером и индикатором значения
				var hbox = HBoxContainer.new()
				var label = Label.new()
				label.text = p["text"] + ":"
				hbox.add_child(label)
				var slider = HSlider.new()
				slider.size_flags_horizontal = Control.SIZE_EXPAND_FILL
				slider.rect_min_size.x = 100
				slider.min_value = p["min value"]
				slider.max_value = p["max value"]
				slider.step = p["step"]
				slider.value = rand_range(p["min value"], p["max value"])
				var val_label = Label.new()
				val_label.text = str(slider.value)
				hbox.add_child(slider)
				hbox.add_child(val_label)
				blocks_container.add_child(hbox)
				# Сохраняем данные для проверки и обновления
				var widget_data = {
					"type": "slider",
					"widget": slider,
					"val_label": val_label,
					"expected_min": p["min d value"],
					"expected_max": p["max d value"]
				}
				param_widgets.append(widget_data)
				# Подключаем сигнал изменения значения слайдера
				slider.connect("value_changed", self, "_on_slider_value_changed", [val_label])
	
	# Обновляем размер фона
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	
	bg.rect_size = ui.get_combined_minimum_size() + Vector2(6, 6)
	if currentTypeOrder == typeOrder.RARE:
		rare_particles.emission_rect_extents = ui.get_combined_minimum_size() + Vector2(6, 6) - (ui.get_combined_minimum_size() + Vector2(6, 6)) / 2
		rare_particles.position = ui.get_combined_minimum_size() + Vector2(6, 6) - (ui.get_combined_minimum_size() + Vector2(6, 6)) / 2
	
	# Анимация появления заказа
	scale.y = 0.0
	if currentTypeOrder != typeOrder.EMERGENCY: _play_sound(load("res://sounds/whatsapp.mp3"))
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
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			# Начинаем перетаскивание
			is_dragging = true
			# Вычисляем смещение от позиции заказа до курсора
			var mouse_global = get_global_mouse_position()
			drag_offset = position - mouse_global
		else:
			# Заканчиваем перетаскивание
			is_dragging = false
	
	if event is InputEventMouseMotion and is_dragging:
		# Перемещаем заказ
		var mouse_global = get_global_mouse_position()
		position = mouse_global + drag_offset


func _on_time_timeout():
	if random_order.get("tags", -1) != -1:
		Global.decrease_weight(random_order.get("tags", -1))
	
	if random_order.has("mods") and random_order["mods"].has("safe skip"):
		if isCompleted: return
	else: if isCompleted: return
	
	remove_from_group("order")
	
	Global._change_timer_spawn_order_wait_time(1.05)
	Global._change_max_count_orders_on_screen(0.95)
	Global._change_completed_orders_count(1.05)
	Global._change_time_to_complete_order(1.2)
	
	canvas_modulate._flash(Color.coral)
	get_tree().get_first_node_in_group("camera")._shake_camera(5.0, 75.0)
	yield(_show_review(false), "completed")
	_try_spawn_order()
	
	queue_free()

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
				if data["widget"].pressed != data["expected"]:
					all_ok = false
					break
			"option":
				if data["widget"].selected != data["expected"]:
					all_ok = false
					break
			"slider":
				var val = data["widget"].value
				if val < data["expected_min"] or val > data["expected_max"]:
					all_ok = false
					break
	
	if all_ok:
		print("pass (все верно)")
		
		Global._change_timer_spawn_order_wait_time(0.97)
		Global._change_max_count_orders_on_screen(1.05)
		Global._change_completed_orders_count(0.97)
		Global._change_time_to_complete_order(0.95)
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
		
		Global._change_timer_spawn_order_wait_time(1.05)
		Global._change_max_count_orders_on_screen(0.95)
		Global._change_completed_orders_count(1.05)
		Global._change_time_to_complete_order(0.98)
		remove_from_group("order")
		
		if random_order.has("mods") and random_order["mods"].has("police count"):
			Global._change_police_count(random_order["mods"]["police count"])
		
		if random_order.get("tags", -1) != -1:
			Global.decrease_weight(random_order.get("tags", -1))
		
		money_label.text = str(random_order["money"] / 2) + "$"
		canvas_modulate._flash(Color.crimson)
		_play_sound(load("res://sounds/damage.mp3"))
		get_tree().get_first_node_in_group("camera")._shake_camera()
		
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
