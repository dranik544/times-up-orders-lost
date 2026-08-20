extends TextureRect

var shakespeed: float = 0.0
var shakesensitivity: float = 0.0
var shakeinterpolate: float = 12.0
var basePosition: Vector2
var spectrum: AudioEffectSpectrumAnalyzerInstance

func _ready():
	_on_update_image_bg()
	get_viewport().connect("size_changed", self, "_on_viewport_size_changed")
	yield(get_tree(), "idle_frame")
	_on_viewport_size_changed()
	Global.connect("updateImageBG", self, "_on_update_image_bg")
	spectrum = AudioServer.get_bus_effect_instance(AudioServer.get_bus_index("MusicBus"), 0)


func _on_update_image_bg():
	if Global.imageBG: texture = Global.imageBG

func _shake_camera(speed: float = 3.0, sensitivity: float = 100.0):
	shakespeed = speed
	shakesensitivity = sensitivity

func _on_viewport_size_changed():
	var viewport_size = get_viewport_rect().size
	rect_size = viewport_size * 1.2
	basePosition = (viewport_size - rect_size) * 0.5
	rect_pivot_offset = rect_size * 0.5

func _process(delta):
	var mouseoffset = -get_viewport().get_mouse_position() * 0.025
	
	var bass_level = spectrum.get_magnitude_for_frequency_range(20, 500).length()
	rect_scale = lerp(rect_scale, Vector2.ONE * (1.0 + bass_level * 0.6), min(25.0 * delta, 1.0))
	
	if shakesensitivity > 0:
		var shake_offset = Vector2(
			rand_range(-shakesensitivity, shakesensitivity),
			rand_range(-shakesensitivity, shakesensitivity)
		)
		var shake_rotation = rand_range(-shakesensitivity, shakesensitivity) * 0.1
		var nPosition = basePosition + mouseoffset + shake_offset
		rect_position = lerp(rect_position, nPosition, min(shakeinterpolate * delta, 1.0))
		rect_rotation = lerp(rect_rotation, shake_rotation, min(shakeinterpolate * delta, 1.0))
		shakesensitivity -= shakespeed
	else:
		rect_position = lerp(rect_position, basePosition + mouseoffset, min(shakeinterpolate * delta, 1.0))
		rect_rotation = lerp(rect_rotation, 0.0, min(shakeinterpolate * delta, 1.0))
