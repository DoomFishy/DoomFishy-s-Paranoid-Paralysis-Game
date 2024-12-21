extends Area2D

var shader_material
var original_position : Vector2
var is_visible : bool = true
var is_replaced : bool = false 

var hover = false

var original : Texture
var replace1 = load("res://sprites/bedroom items/Left/book_left #1.png") 
var replace2 = load("res://sprites/bedroom items/Left/book_left #2.png") 
var replace3 = load("res://sprites/bedroom items/Left/book_left #3.png") 
var replace4 = load("res://sprites/bedroom items/Left/book_left #4.png") 
var replace5 = load("res://sprites/bedroom items/Left/book_left #5.png") 
var replace6 = load("res://sprites/bedroom items/Left/box_left.png") 
var replace7 = load("res://sprites/bedroom items/Left/plant_left #1.png") 
var replace8 = load("res://sprites/bedroom items/Left/plant_left #2.png") 
var replace9 = load("res://sprites/bedroom items/Left/plant_left #3.png") 
var replace10 = load("res://sprites/bedroom items/Left/toy_left #2.png") 
var replace11 = load("res://sprites/bedroom items/Left/toy_left.png") 
var replace12 = load("res://sprites/bedroom items/Left/trophy_left.png") 

func _ready():
	shader_material = $Sprite2D.material
	original_position = position
	original = $Sprite2D.texture
	$disappear_timer.start()
	$replace_timer.start()
	
func _process(delta):
	if hover and Game.start:
		if Input.is_action_just_pressed("left_click"):
			if not is_visible:
				$Sprite2D.visible = true		
				is_visible = true
				Game.terrors_num -= 1
			elif is_replaced:
				$Sprite2D.texture = original
				is_replaced = false
				Game.terrors_num -= 1
			else:
				Game.player_insanity -= 10	
				
func replace():
	if not is_replaced and Game.terrors_num < 6 and Game.start:
		var rng = RandomNumberGenerator.new()
		var randInt = rng.randi_range(1, Game.replace_chance)
		if randInt == 1:
			Game.terrors_num += 1
			var rngTex = RandomNumberGenerator.new()
			var randIntTex = rng.randi_range(1, 12)
			
			match randIntTex:
				1:	
					$Sprite2D.texture = replace1
				2:
					$Sprite2D.texture = replace2
				3:
					$Sprite2D.texture = replace3
				4:
					$Sprite2D.texture = replace4
				5:
					$Sprite2D.texture = replace5
				6:
					$Sprite2D.texture = replace6
				7:
					$Sprite2D.texture = replace7	
				8:
					$Sprite2D.texture = replace8
				9:
					$Sprite2D.texture = replace9				
				10:
					$Sprite2D.texture = replace10			
				11:
					$Sprite2D.texture = replace11			
				12:
					$Sprite2D.texture = replace12				

			is_replaced = true
			
func _on_replace_timer_timeout():
	if is_visible:
		replace()

func disappear():
	if is_visible and Game.terrors_num < 6 and Game.start:
		var rng = RandomNumberGenerator.new()
		var randInt = rng.randi_range(1, Game.disappear_chance)
		if randInt == 1:
			Game.terrors_num += 1
			$Sprite2D.visible = false
			is_visible = false
			
func _on_disappear_timer_timeout():
	if not is_replaced:
		disappear()

func _on_mouse_entered():
	shader_material.set_shader_parameter("line_thickness", 0.2)
	hover = true
	
func _on_mouse_exited():
	shader_material.set_shader_parameter("line_thickness", 0)
	hover = false
