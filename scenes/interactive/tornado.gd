extends Area2D

signal player_enter
const TURN_OFF = preload("res://scenes/sound-effects/turn_off.tscn")

@export var speed = 400
@export var x_variation = 0
@export var y_variation = 0

var starting_position: Vector2
var direction = Vector2(1, 1)

func _ready() -> void:
	starting_position = position

func _physics_process(delta: float) -> void:
	var displacement = position - starting_position

	if abs(displacement.x) >= x_variation:
		direction.x *= -1

	if abs(displacement.y) >= y_variation:
		direction.y *= -1
	if(x_variation):
		position.x += direction.x * speed * delta
	if(y_variation):
		position.y += direction.y * speed * delta


func _on_body_entered(body: Node2D) -> void:
	var sound_instance = TURN_OFF.instantiate()
	add_child(sound_instance)
	var audio_player = sound_instance.get_node("AudioStreamPlayer")
	audio_player.play()
	audio_player.finished.connect(sound_instance.queue_free)
	player_enter.emit()
