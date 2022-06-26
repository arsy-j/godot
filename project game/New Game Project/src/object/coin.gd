extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var score: = 50

func _on_coin_body_entered(body: PhysicsBody2D) -> void:
	anim_player.play("fade")
	
	picked()


func picked() -> void:
	$pickedcoin.play()
	Playerdata.score += score
	
