extends Control

onready var parrent = self.get_parent()
onready var next_scene = preload("res://scenes/game.tscn")

func _on_Textbox_text_entered(new_text):
	var scene_instance = next_scene.instance()
	parrent.add_child(scene_instance)
	var game_scene = get_node("../game")
	game_scene.word = new_text
	queue_free()
