extends CanvasLayer

onready var label_2 = $VBoxContainer/Label2


func _ready():
	label_2.text = (
		"\nИТОГИ ИГРЫ:\n\n" +
		"Собрано денег: " + str(Global.money) + "$" + "\n" +
		"Выполнено заказов: " + str(Global.completedOrders) + "\n" +
		"Репутация: " + str(Global.reputation) + "\n" +
		"Отзывов: " + str(Global.reviews.size()) + "\n" +
		"Преступность: " + str(Global.policeCount) + "/" + str(Global.MAX_POLICE_COUNT) + "\n"
	)
	
	Global._reset()

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://scenes/main.tscn")
