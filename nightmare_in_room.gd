extends Node2D

var replace = load("res://pixil-frame-0.png")

func _ready():
	$Sprite2D.visible = false
	if Game.nightmare_pos == 3:
		$move_timer.start()

func _process(delta):
	if Game.nightmare_pos == 3 and Game.closed == true and Game.just_pressed == true:
		$Sprite2D.visible = true
		position.x = 1768
		position.y = 215
		scale = Vector2(8.21, 8.21)
	if Game.nightmare_pos == 4 and Game.closed == true and Game.just_pressed == true:
		$Sprite2D.texture = replace
		position.x = 932
		position.y = 881
		scale = Vector2(8.21, 8.21)

func move():
	print("rolling")
	var rng = RandomNumberGenerator.new()
	var randInt = rng.randi_range(1, 2)
	if randInt == 1:
		print("move!")
		Game.nightmare_pos += 1

func _on_move_timer_timeout():
	move()
