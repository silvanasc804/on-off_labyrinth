extends CanvasLayer

func _physics_process(delta: float) -> void:
	pass
	

func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()
