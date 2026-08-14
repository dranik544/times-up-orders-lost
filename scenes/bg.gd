extends TextureRect

var shakespeed: float = 0.0
var shakesensitivity: float = 0.0
var shakeinterpolate: float = 15.0
var basePosition: Vector2

func _ready():
	get_viewport().connect("size_changed", self, "_on_viewport_size_changed")
	yield(get_tree(), "idle_frame")
	_on_viewport_size_changed()

func _shake_camera(speed: float = 3.0, sensitivity: float = 100.0):
	shakespeed = speed
	shakesensitivity = sensitivity

func _on_viewport_size_changed():
	var viewport_size = get_viewport_rect().size
	rect_size = viewport_size * 1.2
	basePosition = (viewport_size - rect_size) * 0.5
	rect_pivot_offset = rect_size * 0.5

func _process(delta):
	var mouse_offset = get_viewport().get_mouse_position() * 0.015
	var target_pos = basePosition + mouse_offset
	
	if shakesensitivity > 0:
		var shake_offset = Vector2(
			rand_range(-shakesensitivity, shakesensitivity),
			rand_range(-shakesensitivity, shakesensitivity)
		)
		var shake_rotation = rand_range(-shakesensitivity, shakesensitivity) * 0.1
		var nPosition = target_pos + shake_offset
		rect_position = lerp(rect_position, nPosition, shakeinterpolate * delta)
		rect_rotation = lerp(rect_rotation, shake_rotation, shakeinterpolate * delta)
		shakesensitivity -= shakespeed
	else:
		rect_position = lerp(rect_position, target_pos, shakeinterpolate * delta)
		rect_rotation = lerp(rect_rotation, 0.0, shakeinterpolate * delta)
