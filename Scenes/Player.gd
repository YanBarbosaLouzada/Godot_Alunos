extends KinematicBody2D

var direction = Vector2()
var speed = 4
var life = 100
var fireball = preload("res://Scenes/Fireball.tscn")

func _ready():
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		direction.x = speed
	elif Input.is_key_pressed(KEY_LEFT):
		direction.x =- speed
	else:
		direction.x = 0
		
	if Input.is_key_pressed(KEY_UP):
		direction.y = -speed
	elif Input.is_key_pressed(KEY_DOWN):
		direction.y = speed
	else:
		direction.y = 0
	
	if direction.x == 0 and direction.y == 0:
		get_child(0).animation = "Idle"
	else:
		get_child(0).animation = "Walk"
		
	if self.position.x < get_global_mouse_position().x:
		get_child(0).flip_h = false
	else:
		get_child(0).flip_h = true
	
	if Input.is_action_just_pressed("Shoot"):
		print("Fogo")
		var newFireBall = fireball.instance()
		newFireBall.position = self.position
		self.get_parent().add_child(newFireBall)
		
	if life <= 0:
		print("Morri")
	
	move_and_collide(direction)
