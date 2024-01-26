extends KinematicBody2D

const speed = 25
const maxSpeed = 50

const jumHeight = -300
const up = Vector2(0,-1)
const gravity = 15

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		motion.x = max(motion.x + speed, maxSpeed)
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		motion.x = max(motion.x - speed, -maxSpeed)
	else:
		animationPlayer.play("Idle")
		friction = true
	
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = jumHeight
		if friction == true:
			motion.x = lerp(motion.x,0,0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x,0,0.01)
	
	motion = move_and_slide(motion,up)
			
