extends CharacterBody2D

signal  health_depleted
var health = clamp(100.0, 0, 100.0)

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = (direction * 600) * (health/100)
	move_and_slide()
	
	if direction:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_blob = %HurtBox.get_overlapping_bodies()
	if overlapping_blob.size() > 0:
		health -= DAMAGE_RATE * overlapping_blob.size() * delta
		%health.value = health
		if health <= 0.0:
			health_depleted.emit()

	%ammo.value = $gun.ammo
# Implement some sort of health regen after time later
func take_damage():
	health = health - 5
	%health.value = health
	if health <= 0.0:
		health_depleted.emit()
