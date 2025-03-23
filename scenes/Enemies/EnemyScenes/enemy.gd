extends Node
class_name Enemy

var movement:EnemyMovement = null

func _ready():
	for child in get_children():
		if child is EnemyMovement:
			movement = child
	if movement == null:
		push_error("No EnemyMovement Node found!")
		
func initiate(start_position:Vector2, speed:float, direction:Vector2):
	movement.teleport_to(start_position)
	movement.set_speed(speed)
	movement.set_direction(direction)
