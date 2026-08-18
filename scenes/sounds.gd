extends AudioStreamPlayer


func _ready():
	volume_db += Global.soundsVolume

func _play_sound(sound: AudioStreamMP3):
	stream.audio_stream = sound
	
	play()
	yield(self, "finished")
	
	return true
