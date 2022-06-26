extends RigidBody2D

var score_value = 100
var particle_scene := load("res://src/object/asteroidparticle.tscn")
var asteroid_small := load ("res://src/object/asteroid_small.tscn")
var is_exploded := false
var rng = RandomNumberGenerator.new()

signal explode
signal score_changed

func _ready() -> void:
	var main_camera = get_node("/root/game scene/main_camera")
	self.connect("explode", main_camera, "asteroid_exploded")
	var label = get_tree().get_root().get_node("game scene/gui/MarginContainer/HBoxContainer/VBoxContainer/score")
	self.connect("score_changed", label, "update_score")

func explode():
	if is_exploded:
		return
	
	
	is_exploded = true
	
	particle()
	
	_play_explosion_sfx()
	
	emit_signal("explode")
	emit_signal("score_changed", score_value)
	
	_spawn_smalls(3)
	
	get_parent().remove_child(self)
	queue_free()
		

func particle ():
	var _particle = particle_scene.instance()
	_particle.position = self.position
	get_parent().add_child(_particle)
	_particle.emitting = true

func _spawn_smalls(num: int):
	for i in range(num):
		_spawn_small()

func _spawn_small():
	var small = asteroid_small.instance()
	small.position = self.position
	_randomize_trajectory(small)
	get_parent().add_child(small)

func _play_explosion_sfx():
	var explosion_sound = AudioStreamPlayer2D.new()
	explosion_sound.stream = load("res://assets/sfx/explosion.wav")
	explosion_sound.pitch_scale = 1
	explosion_sound.position = self.position
	get_parent().add_child(explosion_sound)
	explosion_sound.play()

func _randomize_trajectory(asteroid):
	asteroid.angular_velocity = rand_range(-4, 4)
	asteroid.angular_damp = 0
	rng.randomize()
	var lv_x = rng.randi_range(-1, 1)
	var lv_y = rng.randi_range(-1, 1)
	asteroid.linear_velocity = Vector2(lv_x * 400 , lv_y * 400)
	asteroid.linear_damp = 0

func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()
