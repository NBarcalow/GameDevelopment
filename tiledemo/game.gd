extends Node2D

@export var point_1: Vector2 = Vector2(-200,-200)
@export var point_2: Vector2 = Vector2(900,400)
#var pos = %playing_field.ger
@onready var pickup: Resource = preload("res://pickup.tscn")

var pickup_amount = 0

func _ready() -> void:
	$fade/AnimationPlayer.play("out")


func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	
	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	
	return(random_point_inside)
	
func spawn_pickup():
	var active_pickup = preload("res://pickup.tscn").instantiate()
	add_child(active_pickup)
	
	var spawn_location: Vector2 = get_random_point_inside(point_1, point_2)
	active_pickup.set_position(spawn_location)

func _on_timer_timeout() -> void:
	spawn_pickup()
