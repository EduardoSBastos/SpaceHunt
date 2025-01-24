extends Node
class_name Health

@export var max_health:int = 100
@export var is_player:bool = false
@export var hitbox:Hitbox

signal on_zero_health

var health:int:
	set(value):
		health = value
		update_player_health_UI()


func _ready() -> void:
	health = max_health
	assert(hitbox != null)
	hitbox.on_hit_damage.connect(receive_damage)
	call_deferred("update_player_health_UI")


func update_player_health_UI():
	if is_player:
		MyEventBus.on_player_change_health.emit(health, max_health)


func receive_damage(damage: Damage):
	health -= damage.amount
	if health <= 0:
		on_zero_health.emit()
		return
