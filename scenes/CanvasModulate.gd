extends CanvasModulate


func _ready():
	if Global.events["rain"]: color = Color(0.035294, 0.203922, 0.384314)
