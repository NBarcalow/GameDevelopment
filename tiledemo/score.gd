extends Panel
@onready var game = get_node("/root/Game")

func _process(delta: float) -> void:
	$display_score.text = str(game.pickup_amount)
