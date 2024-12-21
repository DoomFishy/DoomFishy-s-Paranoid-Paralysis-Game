extends Node2D

# Declare member variables here. Examples:
var camera_speed = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get the input events
	var input_vector = Vector2()

	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1

	# Normalize the input vector to maintain consistent speed in all directions
	input_vector = input_vector.normalized()

	# Move the Camera2D based on the input
	$Camera2D.offset.x += input_vector.x * camera_speed * delta
	$Camera2D.offset.y += input_vector.y * camera_speed * delta
