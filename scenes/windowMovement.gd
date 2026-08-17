extends Node2D

onready var shadow = $"../shadow"
onready var bg = $"../bg"
onready var message = $"../ui/message"
onready var ui = $"../ui"

var is_dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO
var basePosition: Vector2 = Vector2.ZERO


func _ready():
	get_parent().position
	
	ui.connect("gui_input", self, "_on_ui_gui_input")
	message.connect("gui_input", self, "_on_ui_gui_input")

func _on_ui_gui_input(event):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		if event.pressed:
			# Начинаем перетаскивание
			is_dragging = true
			# Вычисляем смещение от позиции заказа до курсора
			var mouse_global = get_global_mouse_position()
			drag_offset = basePosition - mouse_global
		else:
			# Заканчиваем перетаскивание
			is_dragging = false
	
	if event is InputEventMouseMotion && is_dragging:
		# Перемещаем заказ
		var mouse_global = get_global_mouse_position()
		basePosition = mouse_global + drag_offset

func _process(delta):
	# Лёгкое смещение от мыши (экранные координаты)
	var offset: Vector2
	if Global.system == 0:
		offset = (get_viewport().get_mouse_position() - get_viewport().get_visible_rect().size / 2) * 0.03 if !is_dragging else Vector2(-16.0, -16.0)
	else:
		offset = Vector2.ZERO if !is_dragging else Vector2(-16.0, -16.0)
	var shadowOffset = Vector2(4.0, 4.0) if !is_dragging else Vector2(12.0, 12.0)
	get_parent().position = lerp(get_parent().position, basePosition + offset, 40 * delta)
	shadow.rect_position = lerp(shadow.rect_position, shadowOffset, 40 * delta)
