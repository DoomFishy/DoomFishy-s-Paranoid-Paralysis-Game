extends Sprite2D

func _process(delta):
	if Game.nightmare_pos == 4:
		self.visible = false
