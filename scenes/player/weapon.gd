extends Node

@export var cooldown:float = 0.5
@export var player_FSM: PlayerFSM

var projectile = preload("res://scenes/objects/Projectiles/projectile_0.tscn")
var trigger:float
var current_position:Vector2
var counter: float = 0
var is_active: bool = true

func _ready() -> void:
	if player_FSM != null:
		player_FSM.on_state_transition.connect(toggle_active)

func toggle_active(state):
	is_active = (state == player_FSM.states.alive or state == player_FSM.states.hurt)

func _process(_delta: float) -> void:
	trigger = Input.get_action_strength("shoot")

func _physics_process(delta: float) -> void:
	if counter >= 0:
		counter -= delta
	else:
		if trigger == 1:
			counter = cooldown
			shoot_projectile()


func shoot_projectile():
	if  is_active == false:
		return
	current_position = get_parent().position
	var projectile_instance:Node2D = projectile.instantiate()
	get_tree().get_current_scene().add_child(projectile_instance)
	projectile_instance.position = current_position + Vector2(0, -20)
