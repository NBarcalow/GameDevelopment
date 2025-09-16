extends CharacterBody2D

var health = 15
@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.scale = Vector2(2, 2)
	%CollisionShape2D.scale = Vector2(2, 2)
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 450
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
