extends Area2D

var shader_material
var original_position : Vector2
var is_visible : bool = true
var is_replaced : bool = false 

var hover = false

var original : Texture
var replace1 = load("res://sprites/bedroom items/Front/book_front #1.png") 
var replace2 = load("res://sprites/bedroom items/Front/plant_front #1.png") 

func _ready():
	shader_material = $Sprite2D.material
	original_position = position
	original = $Sprite2D.texture
	
func _process(delta):
	if hover:
		if Input.is_action_just_pressed("left_click"):
			if Game.test_disappear:
				Game.test_disappear = false

			elif Game.test_replace:
				Game.test_replace = false

func _on_mouse_entered():
	shader_material.set_shader_parameter("line_thickness", 0.2)
	hover = true
	
func _on_mouse_exited():
	shader_material.set_shader_parameter("line_thickness", 0)
	hover = false
