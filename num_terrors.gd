extends Label

func _process(delta):
	text = ("Changes: " + str(Game.terrors_num))
