extends Node2D

signal player_fall

var player_alive = true

func change_status(status: bool):
	$"../camino/CollisionPolygon2D".disabled = true
	var player = get_node("../player")
	var position = player.global_position
	var facing = player.get_node("AnimatedSprite2D").flip_h
	
	const PLAYER_ON = preload("res://scenes/player/player_on.tscn")
	const PLAYER = preload("res://scenes/player/player.tscn")
	var player_on_instance = PLAYER_ON.instantiate() if status else PLAYER.instantiate()
	player_on_instance.global_position = position
	player_on_instance.get_node("AnimatedSprite2D").flip_h = facing
	player_on_instance.name = "player" 
	
	var parent = player.get_parent()
	
	call_deferred("_replace_player", parent, player, player_on_instance)

func _replace_player(parent: Node, old_player: Node, new_player: Node) -> void:
	parent.remove_child(old_player)
	old_player.queue_free()
	parent.add_child(new_player)


func _on_camino_body_exited(body: Node2D) -> void:
	if body.name != "player" or $"../camino/CollisionPolygon2D".disabled:
		$"../camino/CollisionPolygon2D".disabled = false
		return
	player_alive = false
	var sprite = $"../player".get_node("AnimatedSprite2D")
	var tween = create_tween()
	tween.tween_property(sprite, "scale", Vector2(0, 0), 1.0)
	tween.tween_callback(Callable(self, "_restart_scene"))

func _on_final_body_entered(body: Node2D) -> void:
	if player_alive:
		get_tree().change_scene_to_file("res://scenes/userinterface/end.tscn")

func _restart_scene():
	get_tree().change_scene_to_file("res://scenes/levels/" + str(get_parent().name) + ".tscn")

func _on_node_2d_player_dead() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/"+str(get_parent().name)+".tscn")

func _on_vela_player_use() -> void:
	change_status(true)

func _on_vela_2_player_use() -> void:
	change_status(true)

func _on_vela_3_player_use() -> void:
	change_status(true)

func _on_vela_4_player_use() -> void:
	change_status(true)

func _on_vela_5_player_use() -> void:
	change_status(true)

func _on_tornado_player_enter() -> void:
	change_status(false)


func _on_area_2d_3_player_dead() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/"+str(get_parent().name)+".tscn")


func _on_area_2d_2_player_dead() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/"+str(get_parent().name)+".tscn")


func _on_area_2d_player_dead() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/"+str(get_parent().name)+".tscn")


func _on_tornado_2_player_enter() -> void:
	change_status(false)


func _on_tornado_3_player_enter() -> void:
	change_status(false)


func _on_tornado_4_player_enter() -> void:
	change_status(false)


func _on_tornado_5_player_enter() -> void:
	change_status(false)


func _on_tornado_6_player_enter() -> void:
	change_status(false)
