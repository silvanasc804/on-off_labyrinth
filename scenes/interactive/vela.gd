class_name Vela
extends Area2D

signal player_use

var vela_status = 1.0
var vela_active = true

func _process(delta: float) -> void:
	if(!vela_active):
		vela_status -= delta
	$Sprite2D.modulate.a = vela_status
	if(vela_status <= 0):
		pass

func _on_body_entered(body: Node2D) -> void:
	vela_active = false
	$CollisionShape2D.call_deferred("set_disabled", true)
	player_use.emit()
