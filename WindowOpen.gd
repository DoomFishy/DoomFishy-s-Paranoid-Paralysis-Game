extends Sprite2D

func _ready():
	self.visible = false

func _process(delta):
	if Game.nightmare_pos == 4:
		self.visible = true
