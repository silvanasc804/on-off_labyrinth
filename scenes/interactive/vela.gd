class_name Vela
extends Area2D

var vela_status = 1.0
var vela_active = true

func _process(delta: float) -> void:
	if(!vela_active):
		vela_status -= delta
	$Sprite2D.modulate.a = vela_status
	if(vela_status <= 0):
		pass

func _on_body_entered(body: Node2D) -> void:
	if(body.name == "player"):
		vela_active = false
