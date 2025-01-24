extends Node

@export var wait_time:float = 2

@export var visible_on_screen_notifier:VisibleOnScreenNotifier2D
@export var timer:Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible_on_screen_notifier.screen_exited.connect(start_timer)
	timer.timeout.connect(self_destruct)

func start_timer():
	print(self.name + ": start timer")
	timer.stop()
	timer.wait_time = wait_time
	timer.start()

func self_destruct():
	print(self.name + ": self destruct")
	self.get_parent().queue_free()
