extends Sprite2D

@export var player_FSM: PlayerFSM

var is_active:bool = true

func _ready() -> void:
	if player_FSM != null:
		player_FSM.on_state_transition.connect(toggle_active)

func toggle_active(state):
	change_sprite_visibility(state != player_FSM.states.dead)

func change_sprite_visibility(active:bool):
	self.visible = active
