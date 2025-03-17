extends AnimationPlayer

@export var animation_name:String = ""
@export var player_FSM:PlayerFSM


func _ready() -> void:
	player_FSM.on_state_transition.connect(play_animation_on_hurt_state)


func play_animation_on_hurt_state(state:int):
	if state == player_FSM.states.hurt:
		self.play(animation_name)
	else:
		self.stop()
