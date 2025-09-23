extends StaticBody2D
const BULLET = preload("res://bullet_blob.tscn")
var on_screen = false
@onready var player = get_node("/root/Game/Player")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if on_screen:
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	on_screen = true
	%autumntree.play("sway")

func _physics_process(delta: float) -> void:
	if (Global.progression) :
		var overlapping_blob = %BreakBox.get_overlapping_bodies()
		if overlapping_blob.size() > 0:
			_play_break_sfx()
			#breakwood.play()
			broken()
			call_deferred("queue_free")
			#queue_free()
			const EXPLOSION = preload("res://explosion.tscn")
			var explosion = EXPLOSION.instantiate()
			get_parent().add_child(explosion)
			explosion.global_position = global_position

func broken():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = global_position
	var to_player = player.global_position - global_position
	new_bullet.global_rotation = to_player.angle()
	get_parent().add_child(new_bullet)

func _play_break_sfx():
	var sfx := AudioStreamPlayer2D.new()
	sfx.stream = preload("res://sounds/Wood_Splitting_9.wav")
	sfx.global_position = global_position
	get_parent().add_child(sfx)
	sfx.play()
	sfx.finished.connect(func(): sfx.queue_free())
	
