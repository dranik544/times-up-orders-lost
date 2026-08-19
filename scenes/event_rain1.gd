extends Control

onready var rain = $rain
onready var lighting = $lighting
onready var timer = $Timer
onready var flash = $flash
onready var sounds = $sounds
onready var bg: TextureRect = $"../../bg"


func _ready():
	if !Global.events["rain"]: queue_free()
	show()
	
	rain.emission_rect_extents = get_viewport().get_visible_rect().size / 1.5
	lighting.emission_rect_extents = get_viewport().get_visible_rect().size / 2
	rain.position = get_viewport().get_visible_rect().size / 2
	lighting.position = get_viewport().get_visible_rect().size / 2
	
	Global.connect("updateTimerSpawnOrdersWaitTime", self, "_on_update_timer_spawn_orders_wait_time")
	timer.connect("timeout", self, "_on_timer_timeout")
	_on_update_timer_spawn_orders_wait_time()
	timer.start()

func _on_update_timer_spawn_orders_wait_time():
	randomize()
	timer.wait_time = rand_range(Global.minTimerSpawnOrdersWaitTime / 1.5, Global.maxTimerSpawnOrdersWaitTime / 1.5)

func _on_timer_timeout():
	print("dsaas")
	randomize()
	flash._flash(Color.white, rand_range(5.0, 12.5), 1.0)
	bg._shake_camera(0.1, 50.0)
	sounds._play_sound(load("res://sounds/lighting1.mp3"))
