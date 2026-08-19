extends AudioStreamPlayer

var current_index: int = 0
onready var music_label = $"../CanvasLayer/musicLabel"
onready var tween = $"../CanvasLayer/musicLabel/Tween"


func _ready():
	if Global.music.empty():
		music_label.queue_free()
		queue_free()
		return
	
	volume_db += Global.soundsVolume
	connect("finished", self, "_on_music_finished")
	
	for i in 3: yield(get_tree(), "idle_frame")
	
	randomize()
	current_index = randi() % Global.music.size() - 1
	play_track(current_index)

func _show_label(lText: String):
	music_label.text = "Сейчас играет: " + lText
	
	music_label.show()
	tween.interpolate_property(music_label, "modulate:a", 0.0, 0.8, 0.5)
	tween.start()
	yield(tween, "tween_completed")
	yield(get_tree().create_timer(4.0), "timeout")
	tween.interpolate_property(music_label, "modulate:a", music_label.modulate.a, 0.0, 0.5)
	tween.start()

func play_track(index: int):
	if index < 0 or index >= Global.music.size():
		index = 0
	
	var path = Global.music[index]
	var stream = _load_audio_stream(path)
	if stream:
		self.stream = stream
		play()
		if music_label:
			_show_label(str(path.get_file().get_basename()))
	else:
		print("Не удалось загрузить: ", path)

func _load_audio_stream(path: String):
	var file = File.new()
	if not file.file_exists(path):
		return null

	var stream: AudioStream = null

	if path.ends_with(".mp3"):
		file.open(path, File.READ)
		var bytes = file.get_buffer(file.get_len())
		file.close()
		var mp3 = AudioStreamMP3.new()
		mp3.data = bytes
		stream = mp3

	elif path.ends_with(".ogg"):
		file.open(path, File.READ)
		var bytes = file.get_buffer(file.get_len())
		file.close()
		var ogg = AudioStreamOGGVorbis.new()
		ogg.data = bytes
		stream = ogg

	elif path.ends_with(".wav"):
		# В Godot 3.6.2 для WAV используется AudioStreamSample
		var wav = AudioStreamSample.new()
		var err = wav.load_from_file(path)
		if err != OK:
			return null
		stream = wav

	return stream

func _on_music_finished():
	current_index += 1
	if current_index >= Global.music.size():
		current_index = 0
	play_track(current_index)
