extends StateMachine
class_name PlayerFSM

var direction: Vector2 = Vector2.ZERO
var is_dead:bool = false
var got_hurt:bool = false
var hurt_state_over:bool = false

signal on_alive_state_process(delta)

@export var health_component:Health
@export var hitbox:Hitbox
@export var hurt_state_timer:Timer

func _ready():
	health_component.on_zero_health.connect(player_died)
	hitbox.on_hit_empty.connect(player_got_hurt)
	hurt_state_timer.timeout.connect(hurt_state_timer_timeout)
	add_state("alive")
	add_state("hurt")
	add_state("dead")
	call_deferred("set_state", states.alive)

func _state_logic(delta:float):
	if state == states.alive:
		on_alive_state_process.emit(delta)
	
	if state == states.hurt:
		pass
	
	if state == states.dead:
		# Dead logic here
		pass


func player_died():
	is_dead = true

func player_got_hurt():
	got_hurt = true

func hurt_state_timer_timeout():
	hurt_state_over = true
	hurt_state_timer.stop()

func _get_transition(_delta):
	match state:
		states.alive:
			if is_dead:
				is_dead = false
				return states.dead
			if got_hurt:
				got_hurt = false
				return states.hurt

		states.hurt:
			if hurt_state_over:
				hurt_state_over = false
				return states.alive

		states.dead:
			if Input.get_action_strength("test") == 1:
				return states.alive


func _enter_state(new_state, _old_state):
	match new_state:
		states.alive:
			pass
		states.hurt:
			hurt_state_timer.start()
		states.dead:
			pass

func _exit_state(_old_state, _new_state):
	pass
	
