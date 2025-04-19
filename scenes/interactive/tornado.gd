extends Area2D

signal player_enter

@export var speed = 400
@export var x_variation = 0
@export var y_variation = 0

var starting_position: Vector2
var direction = Vector2(1, 1)

func _ready() -> void:
	starting_position = position

func _physics_process(delta: float) -> void:
	var displacement = position - starting_position

	if abs(displacement.x) >= x_variation:
		direction.x *= -1

	if abs(displacement.y) >= y_variation:
		direction.y *= -1
	if(x_variation):
		position.x += direction.x * speed * delta
	if(y_variation):
		position.y += direction.y * speed * delta


func _on_body_entered(body: Node2D) -> void:
	player_enter.emit()
