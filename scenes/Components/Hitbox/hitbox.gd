extends Node
class_name Hitbox

signal on_hit_empty
signal on_hit_damage

var is_active:bool = true

@export var player_FSM: PlayerFSM

func _ready() -> void:
	if player_FSM != null:
		player_FSM.on_state_transition.connect(toggle_active)

func toggle_active(state):
	is_active = (state == player_FSM.states.alive)

func receive_colision(damage: Damage) -> void:
	if is_active:
		on_hit_empty.emit()
		on_hit_damage.emit(damage)
