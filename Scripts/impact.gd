extends Node
class_name Impact

@export var area2D: Area2D
@export var damage_amount:int = 0

var damage: Damage
var children:Array

signal on_inpact

func _ready() -> void:
	assert(area2D != null)
	area2D.area_entered.connect(hit_object)
	damage = Damage.new(damage_amount)
	
func hit_object(other_area2D: Area2D) -> void:
	children = other_area2D.get_parent().get_children()
	for child in children:
		if child is Hitbox:
			child.receive_colision(damage)
			on_inpact.emit()
