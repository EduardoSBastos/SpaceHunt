extends Resource
class_name ResEnemeyMoveBase

@export var intial_position:Vector2 = Vector2(0,0)

func get_start_position():
	return intial_position

func get_next_position(current_position:Vector2, delta:float):
	return current_position + Vector2.DOWN * 100 * delta
