extends Node

@export var audio_stream:AudioStream
@export var volume_db:int = 0
@export var autoplay:bool = false

@onready var audio_stream_player:AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	audio_stream_player.stream= audio_stream
	audio_stream_player.volume_db = volume_db
	audio_stream_player.autoplay = autoplay

func play_sound():
	audio_stream_player.play()
