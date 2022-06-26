extends Camera2D

func _on_player_asteroid_laser_shoot() -> void:
	$screen_shake.start(0.1 , 15 , 4, 0)

func asteroid_exploded():
	$screen_shake.start(0.1 , 15 , 10, 0)
	
func asteroid_small_exploded():
	$screen_shake.start(0.1 , 15 , 5, 0)
