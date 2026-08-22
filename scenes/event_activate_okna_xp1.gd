extends Label


func _ready():
	if !Global.events["activate okna xp"]: queue_free()
	
	show()
