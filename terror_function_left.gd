extends Area2D

var shader_material
var original_position : Vector2
var is_visible : bool = true
var is_replaced : bool = false 

var hover = false

var original : Texture
var replace1 = load("res://sprites/bedroom items/Right/book_right #2 (mid).png") 
var replace2 = load("res://sprites/bedroom items/Right/book_right #1 (mid).png") 
var replace3 = load("res://sprites/bedroom items/Right/book_right #2 (midish top).png") 
var replace4 = load("res://sprites/bedroom items/Right/book_right #3 (midish top).png") 
var replace5 = load("res://sprites/bedroom items/Right/box_right (small).png") 
var replace6 = load("res://sprites/bedroom items/Right/box_right.png") 
var replace7 = load("res://sprites/bedroom items/Right/cup_right #1.png") 
var replace8 = load("res://sprites/bedroom items/Right/painting_right #1.png") 
var replace9 = load("res://sprites/bedroom items/Right/painting_right #2.png") 
var replace10 = load("res://sprites/bedroom items/Right/painting_right #3.png") 
var replace11 = load("res://sprites/bedroom items/Right/plant_right #1.png") 
var replace12 = load("res://sprites/bedroom items/Right/plant_right #2.png") 
var replace13 = load("res://sprites/bedroom items/Right/plant_right #3.png") 
var replace14 = load("res://sprites/bedroom items/Right/plant_right #4.png") 
var replace15 = load("res://sprites/bedroom items/Right/rabbit thingy.png") 
var replace16 = load("res://sprites/bedroom items/Right/toy_car .png") 
var replace17 = load("res://sprites/bedroom items/Right/book_right #3 (mid).png")
var replace18 = load("res://sprites/bedroom items/Right/book_right #4 (mid).png")
var replace19 = load("res://sprites/bedroom items/Right/book_right #5 (mid).png")
var replace20 = load("res://sprites/bedroom items/Right/book_right #5 (midish top).png")
var replace21 = load("res://sprites/bedroom items/Right/book_right #6 (midish top).png")
var replace22 = load("res://sprites/bedroom items/Right/book_right #7 (midish top).png")
var replace23 = load("res://sprites/bedroom items/Right/book_right #8 (midish top).png")
var replace24 = load("res://sprites/bedroom items/Right/pills.png")

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
			var randIntTex = rng.randi_range(1, 24)
			
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
				13:
					$Sprite2D.texture = replace13			
				14:
					$Sprite2D.texture = replace14			
				15:
					$Sprite2D.texture = replace15		
				16:
					$Sprite2D.texture = replace16	
				17:
					$Sprite2D.texture = replace17
				18:
					$Sprite2D.texture = replace18
				19:
					$Sprite2D.texture = replace19
				20:
					$Sprite2D.texture = replace20
				21:
					$Sprite2D.texture = replace21
				22:
					$Sprite2D.texture = replace22
				23:
					$Sprite2D.texture = replace23
				24:
					$Sprite2D.texture = replace24					

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
