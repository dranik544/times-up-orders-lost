extends Control

onready var pause_button = $"../pause button"


func _ready():
	pause_button.connect("pressed", self, "_on_pause_button_pressed")

func _on_pause_button_pressed():
	_pause()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		_pause()

func _pause():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused
