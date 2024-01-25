extends Control

var current_player = 1

func _end_turn(player):
	if player == current_player:
		if current_player == 1:
			current_player = 2
			$player_1.visible = false
		elif current_player == 2:
			current_player = 1
			$player_2.visible = false
	else:
		print("error switching scene")

func _on_show_next_pressed():
	if current_player == 1:
		$player_1.visible = true
	elif current_player == 2:
		$player_2.visible = true
