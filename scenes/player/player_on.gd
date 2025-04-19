class_name PlayerOn
extends CharacterBody2D

@export var speed = 400

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = speed * input_direction
	if input_direction:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	if input_direction.x < 0:
		animated_sprite.flip_h = true
	elif input_direction.x > 0:
		animated_sprite.flip_h = false

	move_and_slide()
