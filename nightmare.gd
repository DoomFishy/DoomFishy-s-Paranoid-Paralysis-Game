extends Node2D

var jumpscare = load("res://jumpscare 3.png")
var replace = load("res://smile 3.png")
var replace1 = load("res://nightmare hand.png")
var original = load("res://pixil-frame-0.png")
var player
var hand
var eye1
var eye2
var moving = false

var num = 0

func _ready():
	$move_timer.start()

func _process(delta):
	eye1 = get_node("/root/world/eye/eye1")
	eye2 = get_node("/root/world/eye/eye2")
	
	if moving and Game.start:
		print(str(Game.nightmare_pos) + ", " + str(Game.closed))
		if Game.nightmare_pos == 1 and (Game.closed == true or Game.zeroSanity == true)and Game.nightmare_move == true:
			eye1.visible = true
			eye2.visible = true
			
			eye1.position.x = 768
			eye1.position.y = 252
			eye1.scale = Vector2(0.484, 0.484)
			
			eye2.position.x = 772
			eye2.position.y = 259
			eye2.scale = Vector2(0.484, 0.484)
			print("in pos 1")
			Game.nightmare_pos += 1
			position.x = 749
			position.y = 307
			scale = Vector2(1.603, 1.603)
			moving = false
		elif Game.nightmare_pos == 2 and Game.closed == true and Game.nightmare_move == true:
			eye1.position.x = 823
			eye1.position.y = 192
			eye1.scale = Vector2(0.484, 0.484)
			
			eye2.position.x = 831
			eye2.position.y = 215
			eye2.scale = Vector2(0.484, 0.484)
			
			print("in pos 2")
			Game.nightmare_pos += 1
			position.x = 784
			position.y = 341
			scale = Vector2(4.258, 4.258)
			moving = false
		elif Game.nightmare_pos == 3 and Game.closed == true and Game.nightmare_move == true:
			$"window open".play()
			$"window open squek".play()
			$"nightmare moan".play()
			$"hits".play()
			
			eye1.position.x = 1724
			eye1.position.y = 188
			eye1.scale = Vector2(0.484, 0.484)
			
			eye2.position.x = 1715
			eye2.position.y = 169
			eye2.scale = Vector2(0.484, 0.484)
			
			print("in pos 3")
			Game.nightmare_pos += 1
			$Sprite2D.texture = replace
			position.x = 1730
			position.y = 201
			scale = Vector2(6.803, 6.803)
			moving = false
		elif Game.nightmare_pos == 4 and Game.closed == true and Game.nightmare_move == true:
			eye1.visible = false
			eye2.visible = false
			
			print("in pos 4")
			Game.nightmare_pos += 1
			$Sprite2D.texture = original
			position.x = 949
			position.y = 830
			scale = Vector2(6.803, 6.803)
			
			hand = get_node("/root/world/NightmareHand")
			hand.visible = true
			
			moving = false
		elif Game.nightmare_pos == 5 and Game.closed == true and Game.nightmare_move == true:
			print("in pos 5")
			player = get_node("/root/world/Player")
			position.x = player.position.x
			position.y = player.position.y
			player.get_node("Sprite2D").texture = jumpscare
			Game.jumpscare = true
			
			if num == 0:
				$"jumpscare noise".play()
				num += 1
			
func move():
	if Game.terrors_num <= 2 or (Game.player_insanity > 75 and Game.player_insanity <= 100):
		Game.nightmare_move_chance = 175
	if (Game.terrors_num > 2 and Game.terrors_num <= 4) or (Game.player_insanity > 50 and Game.player_insanity <= 75):
		Game.nightmare_move_chance = 150
	if (Game.terrors_num > 4 and Game.terrors_num < 5) or (Game.player_insanity > 25 and Game.player_insanity <= 50):
		Game.nightmare_move_chance = 125
	if Game.terrors_num == 6 or (Game.player_insanity > 25 and Game.player_insanity <= 0):
		Game.nightmare_move_chance = 100
	if moving == false and Game.start:
		print("rolling")
		var rng = RandomNumberGenerator.new()	
		var randInt = rng.randi_range(1, Game.nightmare_move_chance)
		if randInt == 1:
			print("MOVE!")
			moving = true
			
		
func _on_move_timer_timeout():
	move()

func _on_jumpscare_noise_finished():
	get_tree().change_scene_to_file("res://main.tscn")
