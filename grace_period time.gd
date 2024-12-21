extends Label

func _process(delta):
	text = ("Grace period: " + str(Game.grace_time))
