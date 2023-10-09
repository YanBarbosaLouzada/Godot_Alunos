extends Timer

var enemy = preload("res://Scenes/Enemy.tscn")


func _on_Timer_timeout():
	var newEnemy = enemy.instance()
	newEnemy.global_position = Vector2(rand_range(0,1024), rand_range(0,600))
	get_parent().add_child(newEnemy)
