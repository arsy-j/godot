extends Area2D

var direction := Vector2(0, -1)
var projectile := 1000

func _physics_process(delta: float) -> void:
	self.position += direction * projectile * delta


func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()


func _on_laser_ray_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if (!self.is_queued_for_deletion() && body.is_in_group("asteroid")) :
		#print ("asteroid hit") #<- activate for debungging
		body.call_deferred("explode")
		get_parent().remove_child(self)
		queue_free()
	
