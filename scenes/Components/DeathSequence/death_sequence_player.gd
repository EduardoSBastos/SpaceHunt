extends Node

@export var spawn_on_death:Array[PackedScene]
@export var health:Health

func _ready() -> void:
	if health != null:
		health.on_zero_health.connect(die)

func die_string(_param1:StringName):
	die()

func die():
	for item in spawn_on_death:
		var current_position = get_parent().position
		var item_instance:Node2D = item.instantiate()
		get_tree().get_current_scene().add_child(item_instance)
		item_instance.position = current_position
	# self.get_parent().queue_free()
