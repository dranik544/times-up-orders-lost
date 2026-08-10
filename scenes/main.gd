extends Node2D

onready var timer_spawning_orders = $timerSpawningOrders
onready var timer_canceled = $timerCanceled
onready var money_label = $CanvasLayer/stats/money
onready var canceled_label = $CanvasLayer/stats/canceled
onready var orders = $CanvasLayer/stats/orders
onready var stars = $CanvasLayer/stats/stars
onready var fade = $CanvasLayer/fade
onready var title = $CanvasLayer/title
onready var title_end = $"CanvasLayer/title end"
onready var title_image = $"CanvasLayer/title image"
onready var sound_police = $"sound police"

var money: int = 0
var minTimerWaitTime: float = 30.0
var maxTimerWaitTime: float = 60.0
var orderScene = preload("res://scenes/order1.tscn")
var canceledCount: int = 0
var completeOrders: int = 0
var reviews: Array = []
var rep: float = 5.0
var ended: bool = false
var begined: bool = false
var policeCount: int = 0


func _ready():
	title.hide()
	timer_spawning_orders.connect("timeout", self, "_on_timer_spawning_orders_timeout")
	timer_canceled.connect("timeout", self, "_on_timer_canceled_timeout")
	Global.connect("updateWeights", self, "_update_title_status")

func _add_money(count: int):
	money += count
	print("Сейчас на балансе " + str(money) + "$")
	money_label.text = str(money) + "$ на балансе"

func _on_timer_spawning_orders_timeout():
	_spawn_order()
	
	_reroll_timer_spawning_orders()
	timer_spawning_orders.start()

func _on_timer_canceled_timeout():
	_canceled_change(-1)

func _canceled_change(count: int):
	canceledCount = clamp(canceledCount + count, 0, 3)
	canceled_label.text = str(canceledCount) + "/3 отмен заказа"

func _reroll_timer_spawning_orders():
	randomize()
	timer_spawning_orders.wait_time = rand_range(minTimerWaitTime, maxTimerWaitTime)

func _spawn_order(oType: int = -1):
	print("Спавн заказа с типом: ", oType)   # <-- добавь
	var viewport = get_viewport().get_visible_rect().size
	
	var newOrder = orderScene.instance()
	newOrder.currentTypeOrder = oType
	add_child(newOrder)
	newOrder.position = Vector2(rand_range(0+32, viewport.x-viewport.x/2), rand_range(0+32, viewport.y-viewport.y/2))

func _update_complete_orders_count(count: int):
	completeOrders += count
	orders.text = str(completeOrders) + " Выполненых заказов"

func _add_review(num: float):
	print("Добавлено " + str(num) + " звёзд")
	reviews.append(num)
	_get_review_average()

func _get_review_average():
	if reviews.empty(): return
	var sum: float = 0.0
	for i in reviews:
		sum += i
	
	rep = sum / reviews.size()
	print("Текущая репутация: " + str(rep))
	
	stars.get_node("count reviews").text = str(reviews.size()) + " отзывов"
	for i in stars.get_child_count() - 1:
		stars.get_node("star" + str(i + 1)).hide()
	for i in int(rep):
		stars.get_node("star" + str(i + 1)).show()
	
	if rep < 3:
		_end()

func _end():
	# Концовка
	fade.show()
	var tween: Tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(fade, "modulate:a", 0.0, 1.0, 5.0)
	tween.start()
	yield(tween, "tween_completed")
	tween.queue_free()
	get_tree().change_scene("res://scenes/end.tscn")

func _update_title_status():
	title.get_node("tag1/ProgressBar").value = Global.faction_counts[0]
	title.get_node("tag2/ProgressBar").value = Global.faction_counts[1]
	title.get_node("tag3/ProgressBar").value = Global.faction_counts[2]
	
	if Global.faction_counts[0] >= 30 || Global.faction_counts[1] >= 30 || Global.faction_counts[2] >= 30:
		if ended: return
		print("ended")
		ended = true
		
		title.hide()
		
		if Global.faction_counts[0] >= 30:
			title_end.get_node("Label").text = "СЕМЕЙНЫЙ ПАРЕНЬ"
			title_end.get_node("title icon").texture = load("res://sprites/titul_1.png")
			title_image.texture = load("res://sprites/titul_1.png")
		elif Global.faction_counts[1] >= 30:
			title_end.get_node("Label").text = "СОЦИАЛЬНЫЙ РАЗРАБОТЧИК"
			title_end.get_node("title icon").texture = load("res://sprites/titul_2.png")
			title_image.texture = load("res://sprites/titul_2.png")
		if Global.faction_counts[2] >= 30:
			title_end.get_node("Label").text = "ПАРТНЁР №1"
			title_end.get_node("title icon").texture = load("res://sprites/titul_3.png")
			title_image.texture = load("res://sprites/titul_3.png")
		title_end.show()
		title_image.show()
		
		title_end.get_node("fade").show()
		var tween: Tween = Tween.new()
		add_child(tween)
		tween.interpolate_property(title_end.get_node("fade"), "modulate:a", 0.0, 0.9, 1.0)
		tween.start()
		yield(tween, "tween_completed")
		
		title_end.get_node("Label").show()
		title_end.get_node("effect").show()
		tween.interpolate_property(title_end.get_node("Label"), "modulate:a", 0.0, 1.0, 2.0)
		tween.interpolate_property(title_end.get_node("effect"), "modulate:a", 0.0, 1.0, 2.0)
		tween.start()
		yield(tween, "tween_completed")
		
		title_end.get_node("victory sound").play()
		
		title_end.get_node("title icon").show()
		tween.interpolate_property(title_end.get_node("title icon"), "modulate:a", 0.0, 1.0, 0.5)
		tween.interpolate_property(title_end.get_node("title icon"), "rect_scale", Vector2(6.0, 6.0), Vector2(1.5, 1.5), 3.0, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
		tween.start()
		yield(tween, "tween_completed")
		
		title_end.get_node("Label2").show()
		tween.interpolate_property(title_end.get_node("Label2"), "modulate:a", 0.0, 1.0, 0.5)
		tween.start()
		yield(tween, "tween_completed")
		
		yield(get_tree().create_timer(10.0), "timeout")
		
		tween.interpolate_property(title_end, "modulate:a", 1.0, 0.0, 1.5)
		tween.start()
		yield(tween, "tween_completed")
		
		title_end.hide()
	
	if Global.faction_counts[0] >= 7 || Global.faction_counts[1] >= 7 || Global.faction_counts[2] >= 7:
		if begined: return
		begined = true
		
		_spawn_order(5)
		title.show()
		var tween: Tween = Tween.new()
		add_child(tween)
		tween.interpolate_property(title, "modulate:a", 0.0, 1.0, 3.0)
		tween.start()
		yield(tween, "tween_completed")
		tween.queue_free()

func _add_police_count(count: int):
	policeCount += 1
	
	if policeCount >= 8:
		sound_police.play()
		yield(sound_police, "finished")
		_end()
