extends Area2D
var closest_enemy
var ammo = clamp(20.0, 0, 20.0)
@onready var shoot_sfx: AudioStreamPlayer2D = $shoot_sfx

func _physics_process(delta: float) -> void:
	closest_enemy = get_overlapping_bodies()
	if closest_enemy.size() > 0:
		var target_enemy = closest_enemy.front()
		look_at(target_enemy.global_position)


func shoot():
	const BULLET = preload("res://bullet.tscn")
	if(closest_enemy && ammo > 0):	
		shoot_sfx.play()
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = %barrel.global_position
		new_bullet.global_rotation = %barrel.global_rotation
		%barrel.add_child(new_bullet)
		ammo -= 1

func _on_timer_timeout() -> void:
	shoot()
