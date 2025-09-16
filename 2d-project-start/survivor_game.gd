extends Node2D

func spawn_blob():
	var new_blob = preload("res://blob.tscn").instantiate()
	
	%PathFollow2D.progress_ratio = randf()
	new_blob.global_position = %PathFollow2D.global_position
	add_child(new_blob)
	
func spawn_tree():
	var new_tree = preload("res://tree.tscn").instantiate()
	
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)

func spawn_boss_blob():
	var BOSS_BLOB = preload("res://boss_blob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	BOSS_BLOB.global_position = %PathFollow2D.global_position
	add_child(BOSS_BLOB)
	
func _on_timer_timeout() -> void:
	spawn_blob()

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true


func _on_tree_timeout() -> void:
	spawn_tree()
	$Player/gun.ammo += 1


func _on_boss_timeout() -> void:
	spawn_boss_blob()


func _on_progression_timeout() -> void:
	Global.progression = true
	print("progression")
