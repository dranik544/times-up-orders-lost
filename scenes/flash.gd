extends ColorRect

onready var tween = $Tween


func _flash(_color: Color, speed: float = 1.0, alpha: float = 0.2):
	color = _color
	tween.interpolate_property(self, "color:a", alpha, 0.0, speed)
	tween.start()
	show()
