extends Label


@onready var countdown_timer = $Timer

func _ready():
	countdown_timer.start()
	update_countdown()

func update_countdown():
	var remaining_time = countdown_timer.time_left
	if remaining_time > 0:
		text = "Time remaining: " + str(int(remaining_time)) + " seconds"
	else:
		text = "Time's up!"
