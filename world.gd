extends Node2D

func _ready():
	$win_time.start()
	$sfx/Rain.play()
	$sfx/ambient.play()
	$sfx/slow.play()
	$sfx/wind.play()
	$grace_period.start()
	$ColorRect2.visible = true
	get_node("AnimationPlayer").play("menu_to_game")
	
func _process(delta):
	Game.grace_time = floor($grace_period.time_left)
	if $win_time.time_left > 250:
		Game.time = 12
		Game.replace_chance = 500
		Game.disappear_chance = 400
	if $win_time.time_left < 250 and $win_time.time_left > 200:
		Game.time = 1
		Game.replace_chance = 475
		Game.disappear_chance = 325
	if $win_time.time_left < 200 and $win_time.time_left > 150:
		Game.time = 2
		Game.replace_chance = 425
		Game.disappear_chance = 275
	if $win_time.time_left < 150 and $win_time.time_left > 100:
		Game.time = 3
		Game.replace_chance = 375
		Game.disappear_chance = 275		
	if $win_time.time_left < 100 and $win_time.time_left > 50:
		Game.time = 4
		Game.replace_chance = 325
		Game.disappear_chance = 225
	if $win_time.time_left < 50 and $win_time.time_left > 0:
		Game.time = 5
		Game.replace_chance = 250
		Game.disappear_chance = 225

func _on_win_time_timeout():
	Game.time = 6
	Game.win = true
	$win_time.stop() 
	get_tree().change_scene_to_file("res://win_screen.tscn")

func _on_grace_period_timeout():
	Game.start = true
	$"gui/grace_period time".visible = false
	$"gui/reminder".visible = false

func _on_rain_finished():
	$sfx/Rain.play()

func _on_ambient_finished():
	$sfx/ambient.play()


func _on_slow_finished():
	$sfx/slow.play()

func _on_wind_finished():
	$sfx/wind.play()
