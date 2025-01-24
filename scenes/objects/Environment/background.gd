extends Node2D

@onready var bg = $TextureRect
var start_y
var a

func _ready() -> void:
	start_y = bg.position.y

func move_background() -> void:
	bg.position.y += 1
	if bg.position.y >= 0:
		bg.position.y = start_y


func _process(_delta: float) -> void:
	move_background()
