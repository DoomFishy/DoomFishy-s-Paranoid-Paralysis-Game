extends Control

func _ready():
	$ProgressBar.value = Game.player_insanity
	$TextureProgressBar.value = Game.player_insanity
	$Timer.start()
	
func _process(delta):
	if Game.player_insanity > 100:
		Game.player_insanity = 100
		Game.zeroSanity = false
	elif Game.player_insanity < 50:
		Game.replace_chance = 225
		Game.disappear_chance = 275
		Game.zeroSanity = false
	elif Game.player_insanity <= 0:
		Game.replace_chance = 200
		Game.disappear_chance = 250
		Game.zeroSanity = true
	else:
		Game.replace_chance = 250
		Game.disappear_chance = 300
		Game.zeroSanity = false
	$ProgressBar.value = Game.player_insanity
	$TextureProgressBar.value = Game.player_insanity
	
func _on_timer_timeout():
	if Game.start:
		if Game.closed == false and Game.terrors_num >= 0 and Game.terrors_num <= 2:
			Game.player_insanity -= 1
		elif Game.closed == false and Game.terrors_num > 2 and Game.terrors_num <= 4:
			Game.player_insanity -= 1.2		
		elif Game.closed == false and Game.terrors_num > 4 and Game.terrors_num <= 6:
			Game.player_insanity -= 1.5	
