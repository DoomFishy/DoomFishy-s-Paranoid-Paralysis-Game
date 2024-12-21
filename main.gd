extends Node2D

var shader_material
var hover = false
var button_down = load("res://menu_buttons/play_button_pressed.png")
var button_up = load("res://menu_buttons/play_button_unpressed.png")

func _ready():
	$music.play()
	shader_material = $play_button/Sprite2D.material
	$Timer.start()

func _process(delta):
		
	if hover:
		if Input.is_action_just_pressed("left_click"):
			$play_button/Sprite2D.texture = button_down
			$ColorRect3.visible = true
			get_node("AnimationPlayer").play("transition_to_game")
			
		if Input.is_action_just_released("left_click"):
			$play_button/Sprite2D.texture = button_up
				
func _on_play_button_mouse_entered():
	shader_material.set_shader_parameter("line_thickness", 0.2)
	hover = true

func _on_play_button_mouse_exited():
	shader_material.set_shader_parameter("line_thickness", 0)	
	hover = false

func transition():
	get_tree().change_scene_to_file("res://intro_world.tscn")

func nightmare_flicker():
	var rng = RandomNumberGenerator.new()
	var randInt = rng.randi_range(1, 10)
	if randInt == 1:
		var rng2 = RandomNumberGenerator.new()
		var randInt2 = rng2.randi_range(1, 3)
		
		if randInt2 == 1:
			$nightmare1.visible = true
		
		if randInt2 == 2:
			$nightmare2.visible = true
			
		if randInt2 == 3:
			$nightmare3.visible = true

func _on_timer_timeout():
	nightmare_flicker()
	$flicker_time.start()

func _on_flicker_time_timeout():
	$nightmare1.visible = false
	$nightmare2.visible = false
	$nightmare3.visible = false
	$flicker_time.stop()

func _on_music_finished():
	$music.play()
