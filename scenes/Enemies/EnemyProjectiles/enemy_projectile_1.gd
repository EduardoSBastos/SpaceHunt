extends Node2D

@export var speed = 250

func _physics_process(delta: float) -> void:
	position +=  Vector2.DOWN * speed * delta
