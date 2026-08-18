extends Control

onready var ankh_1 = $HBoxContainer/ankh1
onready var ankh_2 = $HBoxContainer/ankh2
onready var ankh_3 = $HBoxContainer/ankh3
onready var screen_ankh_1 = $"screen ankh1"
onready var main: Node2D = get_tree().current_scene
onready var tween = $Tween
onready var sounds = $sounds

var failedOrdersCount: int = 3
var time: float = 0.0
var baseScreenAnkhPosition: Vector2 = Vector2.ZERO


func _ready():
	if !Global.events["without mistakes"]: queue_free()
	
	show()
	screen_ankh_1.hide()
	baseScreenAnkhPosition = screen_ankh_1.rect_position
	Global.connect("updateFailedOrders", self, "_on_failed_orders")

func _process(delta):
	time += delta
	ankh_1.rect_rotation = sin(time * 2) * 8
	ankh_2.rect_rotation = cos(time * 2) * 8
	ankh_3.rect_rotation = sin(time * 2.2) * 8
	
	if screen_ankh_1.visible:
		screen_ankh_1.rect_position = baseScreenAnkhPosition + Vector2(
			rand_range(-3, 3),
			rand_range(-3, 3)
		)
		screen_ankh_1.rect_rotation = 0.0 + rand_range(-4, 4)

func _on_failed_orders():
	var curAnkh: TextureRect = get_node("HBoxContainer/ankh" + str(failedOrdersCount))
	failedOrdersCount -= 1
	
	if failedOrdersCount < 0:
		main._end()
	else:
		screen_ankh_1.show()
		sounds._play_sound(load("res://sounds/ankh1.mp3"))
		tween.interpolate_property(curAnkh, "rect_scale:x", curAnkh.rect_scale.x, 0.0, 2.0)
		tween.interpolate_property(screen_ankh_1, "modulate:a", 0.0, 1.0, 0.8)
		tween.interpolate_property(screen_ankh_1, "rect_scale", Vector2(3.0, 3.0), Vector2.ONE, 1.5, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
		tween.start()
		
		yield(tween, "tween_completed")
		yield(get_tree().create_timer(1.0), "timeout")
		
		tween.interpolate_property(screen_ankh_1, "modulate:a", 1.0, 0.0, 1.0)
		tween.interpolate_property(screen_ankh_1, "rect_scale", Vector2.ONE, Vector2.ZERO, 1.5, Tween.TRANS_SINE, Tween.EASE_IN)
		tween.start()
		
		yield(get_tree().create_timer(1.0), "timeout")
		screen_ankh_1.hide()
		curAnkh.hide()
