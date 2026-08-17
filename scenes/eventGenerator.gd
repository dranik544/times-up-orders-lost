extends Node

onready var timer = $Timer
onready var main: Node2D = get_tree().current_scene

enum events {ad}
var event_ad1Scene: PackedScene = preload("res://scenes/event_ad1.tscn")


func _ready():
	var delornot: bool = true
	for i in Global.events:
		if Global.events[i] == true: delornot = false; break
	if delornot: queue_free()
	
	timer.connect("timeout", self, "_on_timer_timeout")
	Global.connect("updateTimerSpawnOrdersWaitTime", self, "timer_update_waittime")

func timer_update_waittime():
	timer.wait_time = rand_range(Global.minTimerSpawnOrdersWaitTime, Global.maxTimerSpawnOrdersWaitTime)

func _on_timer_timeout():
	var randevent: int = (randi() % events.size())
	match randevent:
		events.ad:
			if Global.events["ad"]:
				var event: Node2D = event_ad1Scene.instance()
				main.orders_layer.add_child(event)
				event.movement.basePosition = main.get_global_mouse_position()
	
	timer_update_waittime()
