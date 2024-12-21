extends Area2D

var shader_material

func _ready():
	shader_material = $Sprite2D.material

func _on_mouse_entered():
	shader_material.set_shader_parameter("line_thickness", 1.0)
	
func _on_mouse_exited():
	shader_material.set_shader_parameter("line_thickness", 0)
