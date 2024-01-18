extends Control

var number = 0
var max_number = 6
var random = RandomNumberGenerator.new()

func _ready():
	
	random.randomize()
	

func _on_Picker_value_changed(value):
	
	max_number = value
	$VBoxContainer/VBoxContainer/Max_number.text = str(max_number)
	


func _on_Roll_button_pressed():
	
	number = random.randi_range(1, max_number)
	$VBoxContainer/Number.text = str(number)
	
