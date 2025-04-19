extends Node2D

func change_status(status: bool):
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
