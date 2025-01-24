extends Panel
class_name HeartPanel

@export var full_heart_sprite:Sprite2D
@export var empty_heart_sprite:Sprite2D


func _ready() -> void:
	full_heart_sprite.visible = true
	empty_heart_sprite.visible = false


func fill_heart():
	full_heart_sprite.visible = true
	empty_heart_sprite.visible = false


func empty_heart():
	full_heart_sprite.visible = false
	empty_heart_sprite.visible = true
