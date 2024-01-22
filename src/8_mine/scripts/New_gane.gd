extends Control

var bombs_percentage = 25

onready var next_scene = preload("res://scenes/game.tscn")

onready var hard_mode_label = $Hard_mode_label

func _on_bombs_slider_value_changed(value):
	bombs_percentage = value
	$bombs_label.text = "Bombs: " + str(value) + "%"
	if value > 90:
		hard_mode_label.text = "HARD MODE"
		hard_mode_label.add_color_override("font_color", "#ff0000")
		hard_mode_label.visible = true
	elif value < 10:
		hard_mode_label.text = "BABY MODE(lag)"
		hard_mode_label.add_color_override("font_color", "#00ff00")
		hard_mode_label.visible = true
	else:
		hard_mode_label.visible = false

func _on_start_btn_pressed():
	var scene_instance = next_scene.instance()
	self.get_parent().add_child(scene_instance)
	var game_scene = get_node("../game")
	game_scene.bombs_percentage = bombs_percentage
	queue_free()
