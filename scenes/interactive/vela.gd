class_name Vela
extends Area2D

signal player_use

var vela_status = 1.0
var vela_active = true

const TURN_ON = preload("res://scenes/sound-effects/turn_on.tscn")

@export var restore_time = 10

func _process(delta: float) -> void:
	if not vela_active:
		vela_status -= delta
	$Sprite2D.modulate.a = vela_status
	if vela_active and vela_status < 1.0:
		vela_status += delta

func _on_body_entered(body: Node2D) -> void:
	if vela_active:
		var sound_instance = TURN_ON.instantiate()
		add_child(sound_instance)
		var audio_player = sound_instance.get_node("AudioStreamPlayer")
		audio_player.play()
		audio_player.finished.connect(sound_instance.queue_free)
		
		vela_active = false
		$CollisionShape2D.call_deferred("set_disabled", true)
		player_use.emit()
		restore_later()

func restore_later() -> void:
	await get_tree().create_timer(restore_time).timeout
	_restore_vela()

func _restore_vela():
	vela_active = true
	$CollisionShape2D.call_deferred("set_disabled", false)
