extends CharacterBody2D

@export var speed: int

var direction: Vector2 = Vector2.ZERO

func move(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * speed * delta * 100
	move_and_slide()
