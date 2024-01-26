extends KinematicBody2D

var speed = 0.1
var motion = Vector2()
var coin = preload("res://Scenes/Coin.tscn")


func _physics_process(delta):
	motion = Vector2(motion.x + speed,motion.y)
	motion = move_and_slide(motion)
	
