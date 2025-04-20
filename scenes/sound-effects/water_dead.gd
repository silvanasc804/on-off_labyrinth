extends Node

@onready var player: AudioStreamPlayer = $AudioStreamPlayer

func play_water_sound():
	player.play()
