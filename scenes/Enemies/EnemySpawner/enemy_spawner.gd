extends Node
class_name EnemySpawner

@export var time_to_initiate:float = 0
@export var enemy_spawn_resources:Array[EnemySpawnResouorce]
var enemy_red:PackedScene = preload("res://scenes/Enemies/EnemyScenes/enemy_red.tscn")


func _ready() -> void:
	get_tree().create_timer(time_to_initiate).timeout.connect(start)

func start():
	for current_enemy_spawn_resource in enemy_spawn_resources:
		if current_enemy_spawn_resource == null:
			continue
		setup_spawn(current_enemy_spawn_resource)


func setup_spawn(enemy_spawn_resource:EnemySpawnResouorce) -> void:
	var time_to_spawn = enemy_spawn_resource.time_to_spawn
	get_tree().create_timer(time_to_spawn).timeout.connect(spawn_enemy.bind(enemy_spawn_resource))


func spawn_enemy(enemy_spawn_resource:EnemySpawnResouorce) -> void:
	var enemy_instance:Enemy = enemy_spawn_resource.enemy_type.instantiate()
	get_tree().get_current_scene().add_child.call_deferred(enemy_instance)
	enemy_instance.call_deferred("initiate", enemy_spawn_resource.movement)
