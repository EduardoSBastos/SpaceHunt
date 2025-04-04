extends ResEnemeyMoveBase
class_name ResEnemyMoveFollowLine

@export var speed:float = 100
@export var direction:Vector2 = Vector2(0, 1)

func get_next_position(current_position:Vector2, delta:float):
	return current_position + direction * speed * delta
