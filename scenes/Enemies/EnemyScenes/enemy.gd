extends Node
class_name Enemy

var movement:EnemyMovement = null

func _ready():
	for child in get_children():
		if child is EnemyMovement:
			movement = child
	if movement == null:
		push_error("No EnemyMovement Node found!")
		
func initiate(movement_resource:ResEnemeyMoveBase):
	movement.initiate(movement_resource)
