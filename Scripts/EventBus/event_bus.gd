extends Node

signal on_player_change_health(new_amount:int, max_amount:int)

func shutup_debugger():
	on_player_change_health.emit(1,2)
