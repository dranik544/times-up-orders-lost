extends CanvasLayer


func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		Global._reset()
		get_tree().change_scene("res://scenes/main.tscn")
