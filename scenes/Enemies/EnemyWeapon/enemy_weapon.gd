extends Node

@export var triggerTimer:Timer = null
@export_range (1, 10) var my_variable: int
var projectile = preload("res://scenes/Enemies/EnemyProjectiles/Enemy_projectile_1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	triggerTimer.start()
	triggerTimer.timeout.connect(shoot_projectile)


func shoot_projectile() -> void:
	var current_position = get_parent().position
	var projectile_instance:Node2D = projectile.instantiate()
	get_tree().get_current_scene().add_child(projectile_instance)
	projectile_instance.position = current_position + Vector2(0, 20)
