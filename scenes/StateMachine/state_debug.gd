extends Node

@export var playerFSM:PlayerFSM

@export var label:Label

func _ready() -> void:
	playerFSM.on_state_transition.connect(update_state)

func update_state(state):
	label.text = "Sate: " + str(state)
