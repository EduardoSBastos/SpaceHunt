extends Node

@export var enemy_resources:Array[EnemyResouorce]

var enemy_red:PackedScene = preload("res://scenes/Enemies/enemy_red.tscn")

func _ready() -> void:
	for current_enemy_resource in enemy_resources:
		setup_spawn(current_enemy_resource)


func setup_spawn(enemy_resource:EnemyResouorce) -> void:
	var time_to_spawn = enemy_resource.time_to_spawn
	get_tree().create_timer(time_to_spawn).timeout.connect(spawn_enemy.bind(enemy_resource))


func spawn_enemy(enemy_resource:EnemyResouorce) -> void:
	var enemy_instance:Node2D = enemy_resource.enemy_type.instantiate()
	enemy_instance.position = enemy_resource.position
	get_tree().get_current_scene().add_child.call_deferred(enemy_instance)
