extends Node2D

@export var min_time = 0.0
@export var max_time = 10.0
@export var count = 10.0

var player_nearby = false
signal player_dead

const MOUNTAIN_FROZEN = preload("res://art/interactive/mountain_frozen.png")
const MOUNTAIN_SEMI_FROZEN = preload("res://art/interactive/mountain_semi_frozen.png")
const MOUNTAIN_MELTED_ICE = preload("res://art/interactive/mountain_melted_ice.png")

func _process(delta: float) -> void:
	if(player_nearby && count > min_time):
		count -= delta
		if(count < 5): 
			$StaticBody2D/CollisionPolygon2D.disabled = true
			count = 0
		else:
			$StaticBody2D/CollisionPolygon2D.disabled = false
	elif(!player_nearby && count < max_time):
		count += delta
	if(count >= max_time-2):
		$Sprite2D.texture = MOUNTAIN_FROZEN
		$StaticBody2D/CollisionPolygon2D.disabled = false
	elif(count <= 5):
		$Sprite2D.texture = MOUNTAIN_MELTED_ICE
	else:
		$Sprite2D.texture = MOUNTAIN_SEMI_FROZEN
		$StaticBody2D/CollisionPolygon2D.disabled = false
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "player"):
		player_nearby = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.name == "player"):
		player_nearby = false


func _on_body_entered(body: Node2D) -> void:
	player_dead.emit()
