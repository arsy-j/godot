extends KinematicBody2D

const accel = 512
export var speed = 100
const friction = 0.25
export var gravity = 300
const jump = 120
const air_res = 0.10

var motion = Vector2.ZERO
onready var sprite = $Sprite
onready var animation = $AnimationPlayer

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input !=0 :
		animation.play("run")
		sprite.flip_h = x_input < 0
		motion.x += x_input * accel * delta
		motion.x = clamp(motion.x, -speed, speed)
		
	else :
		animation.play("idle")
	
		
	
	motion.y += gravity * delta
	
	if is_on_floor() :
		if x_input == 0 :
			motion.x = lerp(motion.x, 0 ,friction)
			
		if Input.is_action_just_pressed("ui_up") :
			motion.y = -jump
	
	else :
		animation.play("jump")
# warning-ignore:integer_division
		if Input.is_action_just_released("ui_up") and motion.y < -jump/2 :
# warning-ignore:integer_division
			motion.y = -jump/2
		
		if x_input == 0 :
			motion.x = lerp(motion.x, 0 ,air_res)
	
	motion = move_and_slide(motion, Vector2.UP)
