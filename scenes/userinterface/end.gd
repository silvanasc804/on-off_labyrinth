extends CanvasLayer

func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/userinterface/home.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()
