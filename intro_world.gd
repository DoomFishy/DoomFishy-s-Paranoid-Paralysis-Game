extends Node2D

var num = 0
var steps = 0
var replace1 = load("res://sprites/bedroom items/Front/book_front #1.png") 
var replace2 = load("res://sprites/bedroom items/Front/book_front #2.png") 
var replace3 = load("res://sprites/bedroom items/Front/plant_front #1.png") 

func _ready():
	$ColorRect2.visible = true
	$music.play()
	get_node("AnimationPlayer").play("menu_to_game")

func _process(delta):
	print(steps)
	
	if steps == 0:
		if Input.is_action_just_pressed("ui_left"):
			num += 1
		if Input.is_action_just_pressed("ui_right"):
			num += 1
		if num == 2:
			steps += 1
			num = 0
			$"gui/tutorial texts/a and d".visible = false
			
	if steps == 2:
		$"gui/tutorial texts/find disappear".visible = false
		$"gui/tutorial texts/find replace".visible = true
		
		if num == 0:
			replace()
		num += 1
		
		if not Game.test_replace:
			$"front/book_front #2/Sprite2D".texture = replace2
			steps += 1
			num = 0
		
	if steps == 1:
		$"gui/tutorial texts/find disappear".visible = true
		$"gui/tutorial texts/replace and disappear desc".visible = true
		if num == 0:
			disappear()
		num += 1
		
		if not Game.test_disappear:
			$"front/book_front #1/Sprite2D".visible = true
			steps += 1
			num = 0
			
	if steps == 3:
		$"gui/tutorial texts/replace and disappear desc".visible = false
		$"gui/tutorial texts/find replace".visible = false
		$"gui/tutorial texts/insanity bar".visible = true
		$"gui/tutorial texts/insanity bar desc".visible = true
		
		if Input.is_action_just_pressed("ui_accept"):
			steps += 1
	
	if steps == 4:
		$"gui/tutorial texts/insanity bar".visible = false		
		$"gui/tutorial texts/press enter".visible = true	
		
		if Input.is_action_just_pressed("ui_enter"):
			$ColorRect3.visible = true
			get_node("AnimationPlayer").play("change")	
		

func replace():
	$"front/book_front #2/Sprite2D".texture = replace3
	Game.test_replace = true

func disappear():
	var tween1 = get_tree().create_tween()
	tween1.tween_property($"front/book_front #1/Sprite2D", "modulate:a", 0, 0.7)
	
	Game.test_disappear = true

func changeScenes():
	get_tree().change_scene_to_file("res://world.tscn")

func _on_music_finished():
	$music.play()
