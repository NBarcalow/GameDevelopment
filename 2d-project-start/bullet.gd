extends Area2D

var travelled_distance = 0
var bullet_speed = 1000
const BULLET_RANGE = 1200

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * bullet_speed * delta
	
	travelled_distance += bullet_speed * delta
	if travelled_distance > BULLET_RANGE:
		queue_free()
		


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
