extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(get_parent().name)
	call_deferred("_change_scene", int(str(get_parent().name)[-1])+1)

func _change_scene(level: int):
	get_tree().change_scene_to_file("res://scenes/levels/level%d.tscn" % level)
