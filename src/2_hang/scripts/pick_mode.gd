extends Control

onready var parrent = self.get_parent()
onready var manual = preload("res://scenes/pick_word.tscn")

func _on_btn_auto_pressed():
	pass

func _on_btn_manual_pressed():
	var manual_instance = manual.instance()
	parrent.add_child(manual_instance)
	queue_free()
