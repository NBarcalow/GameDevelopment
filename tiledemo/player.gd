extends CharacterBody2D
@onready var game = get_parent()

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 200
	move_and_slide()


	for pickup in %pickupbox.get_overlapping_areas():
		if pickup.has_method("pickedup"):
			pickup.pickedup()
			game.pickup_amount += 1
