extends KinematicBody2D

var speed = 10

func _ready():
	look_at(get_global_mouse_position())

func _process(delta):
	move_and_collide(Vector2(1,0).rotated(rotation)*speed)
	
