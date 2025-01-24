extends HBoxContainer

var heartPanel = preload("res://scenes/GUI/Hearts/heart_panel.tscn")

var max_health:int = 4
var hearts_array = [HeartPanel]


func _ready() -> void:
	MyEventBus.on_player_change_health.connect(update_hearts)
	_update_max_health(max_health)
	

func _update_hearts(current_health:int):
	for index in range(len(hearts_array)):
		if index+1 <= current_health:
			var heart = hearts_array[index] as HeartPanel 
			heart.fill_heart()
		else:
			var heart = hearts_array[index] as HeartPanel 
			heart.empty_heart()


func _add_heart() -> HeartPanel:
	var heart_panel_instance:Panel = heartPanel.instantiate()
	self.add_child(heart_panel_instance)
	return heart_panel_instance


func _update_max_health(new_max_health:int):
	if new_max_health == max_health:
		return
	max_health = new_max_health
	# Clear Hearts
	for heart in hearts_array:
		if heart is HeartPanel:
			heart.queue_free()
	hearts_array = []
	# Create Right amount of Hearts
	for index in range(max_health):
		hearts_array.append(_add_heart())


func update_hearts(new_health: int, max_healtht:int):
	_update_max_health(max_healtht)
	_update_hearts(new_health)
	
