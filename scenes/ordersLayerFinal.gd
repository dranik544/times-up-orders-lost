extends Control

var base_position: Vector2
var base_rotation: float

func _ready():
	base_position = rect_position
	base_rotation = rect_rotation

func _process(delta):
	var camera = get_tree().get_first_node_in_group("camera")
	if camera:
		# Смещение камеры относительно её базовой позиции
		var offset = camera.position - camera.basePosition
		# Применяем смещение к позиции контейнера (с коэффициентом параллакса)
		rect_position = base_position + offset * 0.3
		# Вращение (если нужно)
		rect_rotation = base_rotation + camera.rotation_degrees * 0.05
