extends CanvasLayer

onready var difficulty_option_button = $buttons/VBoxContainer/difficulty/OptionButton
onready var window_aspect_option_button = $"buttons/VBoxContainer/window aspect/OptionButton"
onready var window_mode_option_button = $"buttons/VBoxContainer/window mode/OptionButton"
onready var window_scale_slider = $"buttons/VBoxContainer/window scale/HSlider"
onready var window_fullscreen_check_button = $"buttons/VBoxContainer/window fullscreen"
onready var window_scale_value_label = $"buttons/VBoxContainer/window scale/valueLabel"
onready var uporderiflineeditfocusentered_check_button = $buttons/VBoxContainer/uporderiflineeditfocusentered
onready var apply_button = $buttons/VBoxContainer/apply

onready var continue_button = $buttons/VBoxContainer/continue
onready var fade = $fade

var currentWindowAspect: int = 0
var currentWindowMode: int = 0
var currentWindowSize: Vector2 = Vector2.ZERO
var currentWindowScale: float = 1.0
var currentWindowFullscreen: bool = false


func _ready():
	if Global.system == 1:
		currentWindowScale = 2.2
		window_scale_slider.value = currentWindowScale
		_apply_settings()
		uporderiflineeditfocusentered_check_button.show()
		window_fullscreen_check_button.hide()
		Global.upOrderIfLineEditFocusEntered = true
	else:
		uporderiflineeditfocusentered_check_button.hide()
		window_fullscreen_check_button.show()
		Global.upOrderIfLineEditFocusEntered = false
	
	for i in Global.difficulty:
		difficulty_option_button.add_item(i)
	difficulty_option_button.selected = Global.currentDifficulty
	
	window_aspect_option_button.add_item("Свободный")
	window_aspect_option_button.add_item("4:3")
	window_aspect_option_button.add_item("16:9")
	
	window_mode_option_button.add_item("Свободный")
	window_mode_option_button.add_item("Фиксированный")
	
	window_scale_value_label.text = str(currentWindowScale)
	
	difficulty_option_button.connect("item_selected", self, "_on_difficulty_option_button_item_selected")
	window_aspect_option_button.connect("item_selected", self, "_on_window_aspect_option_button_item_selected")
	window_mode_option_button.connect("item_selected", self, "_on_window_mode_option_button_item_selected")
	window_scale_slider.connect("value_changed", self, "_on_window_scale_slider_value_changed")
	continue_button.connect("pressed", self, "_on_continue_button_pressed")
	apply_button.connect("pressed", self, "_apply_settings")
	window_fullscreen_check_button.connect("pressed", self, "_on_window_fullscreen_check_button_pressed")
	uporderiflineeditfocusentered_check_button.connect("pressed", self, "_on_uporderiflineeditfocusentered_check_button_pressed")
	
	fade.show()
	yield(get_tree().create_timer(0.4), "timeout")
	
	var tween: Tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(fade, "modulate:a", 1.0, 0.0, 1.0)
	tween.start()
	yield(tween, "tween_completed")
	fade.hide()
	tween.queue_free()

func _on_difficulty_option_button_item_selected(index: int):
	Global.currentDifficulty = index

func _on_window_aspect_option_button_item_selected(index: int):
	currentWindowAspect = index

func _on_window_mode_option_button_item_selected(index: int):
	currentWindowMode = index

func _on_window_scale_slider_value_changed(value: float):
	currentWindowScale = value
	window_scale_value_label.text = str(value)

func _on_window_fullscreen_check_button_pressed():
	currentWindowFullscreen = window_fullscreen_check_button.pressed

func _on_uporderiflineeditfocusentered_check_button_pressed():
	Global.upOrderIfLineEditFocusEntered = uporderiflineeditfocusentered_check_button.pressed

func _apply_settings():
	# Определяем размер и аспект в зависимости от выбора
	var base_size: Vector2
	var aspect_mode: int
	match currentWindowAspect:
		0:   # Свободный
			base_size = Vector2(960, 720)
			aspect_mode = SceneTree.STRETCH_ASPECT_EXPAND
		1:   # 4:3
			base_size = Vector2(960, 720)
			aspect_mode = SceneTree.STRETCH_ASPECT_KEEP
		2:   # 16:9
			base_size = Vector2(960, 540)
			aspect_mode = SceneTree.STRETCH_ASPECT_KEEP
	
	var stretch_mode: int
	match currentWindowMode:
		0:   # Свободный
			stretch_mode = SceneTree.STRETCH_MODE_2D
		1:   # Фиксированный
			stretch_mode = SceneTree.STRETCH_MODE_VIEWPORT
	
	get_tree().set_screen_stretch(stretch_mode, aspect_mode, base_size, currentWindowScale)
	OS.window_fullscreen = currentWindowFullscreen

func _on_continue_button_pressed():
	fade.show()
	var tween: Tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(fade, "modulate:a", 0.0, 1.0, 1.0)
	tween.start()
	yield(tween, "tween_completed")
	tween.queue_free()
	
	get_tree().change_scene("res://scenes/main.tscn")
