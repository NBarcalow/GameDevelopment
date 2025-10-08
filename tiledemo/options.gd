extends Node2D

@onready var project_theme = ThemeDB.get_default_theme() 

var font_normal = preload("res://font/ThaleahFat.ttf")
var font_dys = preload("res://font/OpenDyslexic3-Regular.ttf")

func _ready() -> void:
	$fade/AnimationPlayer.play("out")


func _on_normal_toggled(toggled_on: bool) -> void:
	if toggled_on :
		project_theme.theme.set_default_font(font_normal)
		project_theme.theme.set_default_font_size(16)
		print("normal")


func _on_dyslexia_toggled(toggled_on: bool) -> void:
		if toggled_on :
			project_theme.theme.set_default_font(font_dys)
			project_theme.theme.set_default_font_size(16)
			print("normal")



func _on_back_pressed() -> void:
	$fade/AnimationPlayer.play("in")
	get_tree().change_scene_to_file("res://main_menu.tscn")
