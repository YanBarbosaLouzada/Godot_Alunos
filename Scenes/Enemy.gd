extends KinematicBody2D

var player
var angle
var speed = 3
var life = 30


func _ready():
	player = get_parent().get_child(0)
	angle = get_angle_to(player.position)


func _process(delta):
	angle = get_angle_to(player.position)
	if position.distance_to(player.position) > 75:
		move_and_collide(Vector2(1,0).rotated(angle) * speed)
	else:
		player.life -= 10
		get_parent().remove_child(self)
		
	if life <= 0:
		get_parent().remove_child(self)
		
		
		
