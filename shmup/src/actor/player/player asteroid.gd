extends KinematicBody2D


const speed := 300
signal laser_shoot

func _physics_process(delta: float) -> void:
	var velocity := Vector2()
	
	if (Input.is_action_pressed("left")) :
		velocity.x = -speed 
	if (Input.is_action_pressed("right")) :
		velocity.x = speed
	
	#print("player pos",velocity)
	move_and_collide(velocity * delta)

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("laser")):
		$laser_sfx.play()
		$laser.shoot()
		emit_signal("laser_shoot")


func _on_hitbox_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if(!self.is_queued_for_deletion() && body.is_in_group("asteroid")):
		queue_free()
