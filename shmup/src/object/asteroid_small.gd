extends "res://src/object/asteroid.gd"

func _ready() -> void:
	var main_camera = get_node("/root/Game/MainCamera")
	self.connect("explode", main_camera, "asteroid_small_exploded")
	score_value = 250

func explode():
	if is_exploded:
		return
		
	emit_signal("explode")
	emit_signal("score_changed", score_value)
	
	is_exploded = true
	particle()
	_play_explosion_sfx()
	get_parent().remove_child(self)
	queue_free()
		


func _play_explosion_sfx():
	var explosion_sound = AudioStreamPlayer2D.new()
	explosion_sound.stream = load("res://assets/sfx/explosion.wav")
	explosion_sound.pitch_scale = 1.2
	explosion_sound.position = self.position
	get_parent().add_child(explosion_sound)
	explosion_sound.play()
