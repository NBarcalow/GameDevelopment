extends Area2D

func _physics_process(delta: float) -> void:
	var closest_enemy = get_overlapping_bodies()
	if closest_enemy.size() > 0:
		var target_enemy = closest_enemy.front()
		look_at(target_enemy.global_position)


func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %barrel.global_position
	new_bullet.global_rotation = %barrel.global_rotation
	%barrel.add_child(new_bullet)

func _on_timer_timeout() -> void:
	shoot()
