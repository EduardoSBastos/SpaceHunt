extends Node

@export var speed: int
@export var player_FSM:PlayerFSM

@onready var parent = get_parent()
var direction: Vector2 = Vector2.ZERO
var movement_active:bool = true


func _ready() -> void:
	player_FSM.on_state_transition.connect(toggle_active)


func _physics_process(delta: float) -> void:
	if not movement_active:
		return
	direction = Input.get_vector("left", "right", "up", "down")
	parent.velocity = direction.normalized() * speed * delta * 100
	parent.move_and_slide()


func toggle_active(state:int):
	movement_active = (state == player_FSM.states.alive or state == player_FSM.states.hurt)
