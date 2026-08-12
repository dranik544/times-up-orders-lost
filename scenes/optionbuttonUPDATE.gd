extends OptionButton

func _ready():
	connect("pressed", self, "_on_OptionButton_pressed")

func _on_OptionButton_pressed():
	yield(get_tree(), "idle_frame")
	get_popup().rect_scale = Vector2.ONE
	var screen_pos = get_global_transform_with_canvas().origin
	get_popup().rect_global_position = screen_pos + Vector2(0, rect_size.y)
