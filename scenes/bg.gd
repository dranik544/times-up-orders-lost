extends TextureRect

var basePosition: Vector2 = rect_position


func _ready():
	get_viewport().connect("size_changed", self, "_on_viewport_size_changed")
	_on_viewport_size_changed()

func _on_viewport_size_changed():
	rect_size = get_viewport_rect().size * 1.1
	rect_pivot_offset = rect_size / 2
	basePosition = Vector2(-1.0, -1.0) * rect_size * 0.05
	
	print("size changed into: " + str(rect_size))

func _process(delta):
	rect_position = basePosition + get_global_mouse_position() * 0.02
