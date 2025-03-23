extends Node
class_name EnemyMovement

@export var speed: float
@export var direction:Vector2
@export var root_node:Node2D

var position:Vector2


func _ready() -> void:
	position = root_node.position

func _process(delta: float) -> void:
	position += speed * direction * delta
	root_node.position = position

func teleport_to(new_position:Vector2):
	root_node.position = new_position
	position = new_position
	
func set_speed(new_speed:float):
	speed = new_speed

func set_direction(new_direction:Vector2):
	direction = new_direction
