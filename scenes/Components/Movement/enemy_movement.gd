extends Node
class_name EnemyMovement

@export var speed: float
@export var root_node:Node2D
#@export var direction:Vector2

var position:Vector2
var movement_resource:ResEnemeyMoveBase

func initiate(new_movement_resource:ResEnemeyMoveBase):
	movement_resource = new_movement_resource
	root_node.position = movement_resource.get_start_position()

func _process(delta: float) -> void:
	# position += speed * direction * delta
	root_node.position = movement_resource.get_next_position(root_node.position, delta)

#func teleport_to(new_position:Vector2):
#	root_node.position = new_position
#	position = new_position

#func set_speed(new_speed:float):
#	speed = new_speed

#func set_direction(new_direction:Vector2):
#	direction = new_direction
