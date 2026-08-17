extends Node2D

onready var shadow = $shadow
onready var bg = $bg
onready var ui = $ui
onready var message = $ui/message
onready var texture_rect = $ui/message/TextureRect
onready var ready = $ui/ready
onready var tween_complete_order = $TweenCompleteOrder
onready var sounds = $sounds
onready var movement = $windowMovement
onready var particles = $particles

var textures: Array = [
	preload("res://sprites/event_ad1.png"),
	preload("res://sprites/event_ad2.png"),
	preload("res://sprites/event_ad3.png"),
	preload("res://sprites/event_ad4.png"),
	preload("res://sprites/event_ad5.png"),
	preload("res://sprites/event_ad6.png"),
	preload("res://sprites/event_ad7.png"),
]
var triesclose: int = 5


func _ready():
	add_to_group("event")
	
	randomize()
	var randsize: float = rand_range(0.5, 4.0)
	texture_rect.rect_min_size = Vector2(
		128*randsize,
		64*randsize
	)
	
	texture_rect.texture = textures[randi() % textures.size()]
	triesclose = rand_range(0, 10)
	
	ready.connect("pressed", self, "_on_ready_pressed")
	
	yield(get_tree().create_timer(0.05, false), "timeout")
	
	sounds._play_sound(load("res://sounds/adsound1.mp3"))
	_show_with_animation()
	
	bg.rect_size = ui.get_combined_minimum_size() + Vector2(6, 6)
	shadow.rect_size = ui.get_combined_minimum_size() + Vector2(6, 6)
	particles.emission_rect_extents = ui.get_combined_minimum_size() + Vector2(6, 6) - (ui.get_combined_minimum_size() + Vector2(6, 6)) / 2
	particles.position = ui.get_combined_minimum_size() + Vector2(6, 6) - (ui.get_combined_minimum_size() + Vector2(6, 6)) / 2

func _on_ready_pressed():
	if triesclose <= 0:
		yield(_hide_with_animation(), "completed")
		queue_free()
		return
	
	sounds._play_sound(load("res://sounds/adsound2.mp3"))
	movement.basePosition = Vector2(
		rand_range(32, get_viewport().get_visible_rect().size.x - 240),
		rand_range(32, get_viewport().get_visible_rect().size.y - 320)
	)
	triesclose -= 1

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
