extends EnemyMovement

@export var target_position:Vector2 = Vector2(100,100)
@onready var tween = create_tween()

func _process(delta: float) -> void:
	
	tween.tween_property(
		self,              # Node to animate
		"position",        # Property to change
		target_position,   # End position
		1.0                # Duration in seconds
	).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)  # Easing
	
	position += speed * direction * delta
	root_node.position = position
