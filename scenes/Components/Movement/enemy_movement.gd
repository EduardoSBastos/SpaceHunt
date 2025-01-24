extends Node

@export var speed:Vector2

@export var root_node:Node2D

var position:Vector2
var active:bool


func _ready() -> void:
	position = root_node.position
	active = get_parent().get_movement_state()
	

func _process(delta: float) -> void:
	if !active:
		return
	position += speed * delta
	root_node.position = position
