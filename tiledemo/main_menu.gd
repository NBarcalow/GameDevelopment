extends Node2D

var button_type = null

func _ready() -> void:
	$fade/AnimationPlayer.play("out")
	await get_tree().create_timer(1.5).timeout
	$fade.visible = false

func _on_start_pressed() -> void:
	button_type = "start"
	$fade.show()
	$fade/fade_timer.start()
	$fade/AnimationPlayer.play("in")

func _on_options_pressed() -> void:
	button_type = "options"
	$fade.show()
	$fade/fade_timer.start()
	$fade/AnimationPlayer.play("in")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" : 
		get_tree().change_scene_to_file("res://game.tscn")
		
	elif button_type == "options" :
		get_tree().change_scene_to_file("res://Options.tscn")
