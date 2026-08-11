extends Camera2D

var shakespeed: float = 0.0
var shakesensitivity: float = 0.0
var shakeinterpolate: float = 25.0
export(Vector2) var basePosition = position

var time: float = 0.0


func _ready():
	add_to_group("camera")

func _shake_camera(speed: float = 3.0, sensitivity: float = 100.0):
	shakespeed = speed
	shakesensitivity = sensitivity
	
	print("cam shake")

func _process(delta):
#	time += delta
	
	offset = Vector2.ZERO + get_global_mouse_position() * 0.01
#	var wPosition: Vector2 = Vector2.ZERO + Vector2(
#		sin(time * 0.9) * 3.0,
#		cos(time * 0.9) * 2.0
#	)
#	print(wPosition)
	
	if shakesensitivity > 0:
		var nPosition = basePosition + Vector2(
			rand_range(-shakesensitivity, shakesensitivity),
			rand_range(-shakesensitivity, shakesensitivity)
		) #+ wPosition
		var nRotation = rand_range(-shakesensitivity, shakesensitivity) * 0.06
		
		position = lerp(position, nPosition, shakeinterpolate * delta)
		rotation_degrees = lerp(rotation_degrees, nRotation, shakeinterpolate * delta)
#		position = nPosition
		
		shakesensitivity -= shakespeed
	else:
		position = basePosition #+ wPosition
		rotation_degrees = 0.0
