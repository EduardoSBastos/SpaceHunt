extends Node2D

@export var speed = 500

func _physics_process(delta: float) -> void:
	position +=  Vector2.UP * speed * delta
