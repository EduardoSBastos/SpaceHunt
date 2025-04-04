@tool
extends PathFollow2D

@export var process:bool = true
@export var factor:int = 50

func _process(delta: float) -> void:
	if process:
		progress += delta * factor
