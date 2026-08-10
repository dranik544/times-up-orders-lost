extends CanvasModulate

onready var tween = $Tween


func _flash(_color: Color, speed: float = 1.0):
	color = _color
	tween.interpolate_property(self, "color", color, Color.white, speed)
	tween.start()
