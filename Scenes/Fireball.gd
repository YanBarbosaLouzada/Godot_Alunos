extends KinematicBody2D

var speed = 10

func _ready():
	look_at(get_global_mouse_position())

func _process(delta):
	var colidiu = move_and_collide(Vector2(1,0).rotated(rotation)*speed)
	
	if colidiu:
		if "Enemy" in colidiu.collider.name:
			print("colidi com um inimigo")
			colidiu.collider.set("life",colidiu.collider.life - 10)
			get_parent().remove_child(self)
	
