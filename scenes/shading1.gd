extends TextureRect


func _flash(speed: float = 4.0):
	var tween: Tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "modulate:a", 1.0, 1.0/5, speed)
	tween.start()
	yield(tween, "tween_completed")
	tween.queue_free()
