extends CanvasLayer

onready var difficulty_option_button = $buttons/VBoxContainer/difficulty/OptionButton
onready var continue_button = $buttons/VBoxContainer/continue
onready var fade = $fade


func _ready():
	for i in Global.difficulty:
		difficulty_option_button.add_item(i)
	difficulty_option_button.selected = Global.currentDifficulty
	
	difficulty_option_button.connect("item_selected", self, "_on_difficulty_option_button_item_selected")
	continue_button.connect("pressed", self, "_on_continue_button_pressed")

func _on_difficulty_option_button_item_selected(index: int):
	Global.currentDifficulty = index

func _on_continue_button_pressed():
	fade.show()
	var tween: Tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(fade, "modulate:a", 0.0, 1.0, 1.0)
	tween.start()
	yield(tween, "tween_completed")
	tween.queue_free()
	
	get_tree().change_scene("res://scenes/main.tscn")
