extends StaticBody2D
	
var on_screen = false


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if on_screen:
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	on_screen = true
