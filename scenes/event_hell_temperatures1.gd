extends Control

onready var fire = $fire
onready var fire_texture = $fire_texture
onready var color_rect = $ColorRect
onready var button = $Button
onready var progress_bar = $Button/ProgressBar
onready var timer = $Timer
onready var temperature_label = $"../stats/temperature"
onready var tween = $Tween
onready var button_timer = $Button/buttonTimer
onready var button_tween = $Button/buttonTween
onready var sounds = $sounds
onready var main: Node2D = get_tree().current_scene

var temp: int = 10
var temp1thsd: bool = false
var temp2thsd: bool = false
var temp3thsd: bool = false


func _ready():
	if !Global.events["hell temperatures"]:
		temperature_label.queue_free()
		queue_free()
	
	fire.emission_rect_extents = get_viewport().get_visible_rect().size / 1.8
	fire.modulate.a = 0.0
	fire_texture.modulate.a = 0.0
	color_rect.modulate.a = 0.0
	button.hide()
	show()
	
	timer.connect("timeout", self, "_on_timer_timeout")
	button_timer.connect("timeout", self, "_on_button_timer_timeout")
	button.connect("button_down", self, "_on_button_down")
	button.connect("button_up", self, "_on_button_up")
	
	_set_timer_waittime()
	timer.start()

func _on_timer_timeout():
	temp += 1
	temperature_label.text = "Температура ПК (°C): " + str(temp)
	_set_timer_waittime()
	timer.start()
	
	if temp3thsd: return
	if temp >= 110:
		temp3thsd = true
		main._end()
	
	if temp2thsd: return
	if temp >= 85:
		temp2thsd = true
		tween.interpolate_property(color_rect, "modulate:a", color_rect.modulate.a, 1.0, 1.0)
		tween.interpolate_property(fire_texture, "modulate:a", fire_texture.modulate.a, 1.0, 2.0)
		tween.interpolate_property(temperature_label, "modulate", temperature_label.modulate, Color(1.0, 0.0, 0.0), 2.0)
		tween.interpolate_property(fire, "modulate:a", 0.0, 1.0, 2.0)
		tween.start()
	
	if temp1thsd: return
	if temp >= 70:
		temp1thsd = true
		tween.interpolate_property(color_rect, "modulate:a", 0.0, 0.25, 1.0)
		tween.interpolate_property(temperature_label, "modulate", temperature_label.modulate, Color(1.0, 0.5, 0.5), 2.0)
		tween.interpolate_property(fire_texture, "modulate:a", 0.0, 0.25, 2.0)
		tween.interpolate_property(button, "modulate:a", 0.0, 1.0, 0.25)
		button.show()
		tween.start()

func _set_timer_waittime():
	timer.wait_time = rand_range(0.5, 1.0)

func _on_button_down():
	button_timer.start()
	
	button_tween.stop_all()
	progress_bar.value = 0.0
	button_tween.interpolate_property(progress_bar, "value", 0.0, 100.0, button_timer.wait_time)
	button_tween.start()
	sounds.play()

func _on_button_up():
	button_timer.stop()
	
	button_tween.stop_all()
	progress_bar.value = 0.0
	sounds.stop()

func _on_button_timer_timeout():
	temp1thsd = false
	temp2thsd = false
	temp3thsd = false
	
	temp = int(rand_range(5, 15))
	temperature_label.text = "Температура ПК (°C): " + str(temp)
	tween.interpolate_property(color_rect, "modulate:a", color_rect.modulate.a, 0.0, 1.0)
	tween.interpolate_property(fire_texture, "modulate:a", fire_texture.modulate.a, 0.0, 2.0)
	tween.interpolate_property(fire, "modulate:a", 0.0, 0.0, 2.0)
	tween.interpolate_property(temperature_label, "modulate", temperature_label.modulate, Color(1.0, 1.0, 1.0), 4.0)
	button.hide()
	tween.start()
