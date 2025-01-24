extends AnimationPlayer

@export var animation_name:String = ""

func play_animation():
	self.play(animation_name)
