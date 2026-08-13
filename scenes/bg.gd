extends TextureRect

var basePosition: Vector2 = rect_position


func _process(delta):
	rect_position = basePosition + get_global_mouse_position() * 0.02
