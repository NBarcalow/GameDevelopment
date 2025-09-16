extends StaticBody2D
const BULLET = preload("res://bullet_blob.tscn")
var on_screen = false
@onready var player = get_node("/root/Game/Player")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if on_screen:
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	on_screen = true

func _physics_process(delta: float) -> void:
	if (Global.progression) :
		var overlapping_blob = %BreakBox.get_overlapping_bodies()
		if overlapping_blob.size() > 0:
			broken()
			queue_free()
			const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
			var smoke = SMOKE_SCENE.instantiate()
			get_parent().add_child(smoke)
			smoke.global_position = global_position

func broken():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = global_position
	var to_player = player.global_position - global_position
	new_bullet.global_rotation = to_player.angle()
	get_parent().add_child(new_bullet)
