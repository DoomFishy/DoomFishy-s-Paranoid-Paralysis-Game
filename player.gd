extends CharacterBody2D


var replace = load("res://jumpscare 2.png")

const SPEED = 375.0
var acc = 50
var last_dir = 0
var direction = 0

func _physics_process(delta):
	
	if Game.start:
		if Game.player_insanity <= 0 and not Input.is_action_pressed("ui_accept"):
			get_node("AnimationPlayer").play("flash")
			Game.zeroSanity = true
		if Game.player_insanity > 0 and Game.closed == false:
			get_node("AnimationPlayer").play("RESET")
		
	var input_dir : Vector2 = input()
	if not Game.jumpscare and not Game.win:
		input()
		accelerate(input_dir)
		close_eyes()
		
		move_and_slide()
	
func input() -> Vector2:
	var input_dir : Vector2 = Vector2.ZERO
	
	input_dir.x = Input.get_axis("ui_left", "ui_right")
	
	if input_dir.x == -1:
		direction = -1
		last_dir = -1
	elif input_dir.x == 1:
		direction = 1
		last_dir = 1
	else:
		direction = 0
	
	input_dir = input_dir.normalized()
	return input_dir
	
func accelerate(direction):
	velocity = velocity.move_toward(SPEED * direction, acc)

func close_eyes():
	if Input.is_action_pressed("ui_accept"):
		if Game.closed == false:
			$Timer.start()
			get_node("AnimationPlayer").play("fade in")
		Game.closed = true

	if Input.is_action_just_released("ui_accept"):
		print("open")
		get_node("AnimationPlayer").play("fade")
		Game.closed = false
		$Timer.stop()
		
func move_nightmare(value):
	Game.nightmare_move = value

func _on_timer_timeout():
	Game.player_insanity += 1.5

func closed(value):
	Game.closed = value

