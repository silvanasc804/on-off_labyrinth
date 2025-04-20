extends CanvasLayer

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect.visible
		$Label.visible = not $Label.visible
		$Button.visible = not $Button.visible
		if get_tree().paused:
			$AudioStreamPlayer.play()
		else:
			$AudioStreamPlayer.stop()

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/userinterface/home.tscn")
