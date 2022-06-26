tool

extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene

func _on_portal2d_body_entered(body: PhysicsBody2D) -> void:
	$CollisionShape2D/AudioStreamPlayer2D.play()
	teleport()


func _get_configuration_warning() -> String:
	return "the next scene can't be empty" if not next_scene else ""

func teleport() ->void:
	anim_player.play("fade in")
	yield(anim_player,"animation_finished")
	get_tree().change_scene_to(next_scene)

