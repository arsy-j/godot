extends Node

var asteroid_spawn = load ("res://src/object/asteroid.tscn")

func _ready() -> void:
	_spawn()

func _spawn():
	var asteroid = asteroid_spawn.instance()
	set_asteroid_position(asteroid)
	_set_asteroid_trajectory(asteroid)
	add_child(asteroid)

func _on_spawntimer_timeout() -> void:
	_spawn()

func set_asteroid_position(asteroid) :
	var rect = get_viewport().size
	asteroid.position = Vector2(rand_range(0, rect.x), -100)

func _set_asteroid_trajectory(asteroid):
	asteroid.angular_velocity = rand_range(-4, 4)
	asteroid.angular_damp = 0
	asteroid.linear_velocity = Vector2(rand_range(-300 , 300), 200)
	asteroid.angular_damp = 0
