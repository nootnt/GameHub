extends Control

var dmg_state = 0
export var word: String = ""

var word_label_text: String = ""
var found_letters: Array = []

var word_temp = ""
var underscore = "_"

onready var pole1 = $HSplitContainer/man_container/man/pole1
onready var pole2 = $HSplitContainer/man_container/man/pole2
onready var pole3 = $HSplitContainer/man_container/man/pole3
onready var head = $HSplitContainer/man_container/man/head
onready var body = $HSplitContainer/man_container/man/body
onready var arm1 = $HSplitContainer/man_container/man/arm1
onready var arm2 = $HSplitContainer/man_container/man/arm2
onready var leg1 = $HSplitContainer/man_container/man/leg1
onready var leg2 = $HSplitContainer/man_container/man/leg2

onready var word_label = $HSplitContainer/VSplitContainer/MarginContainer/word

onready var End_state_display = $End_state_display
onready var close_timer = $Close_timer

func _ready():
	
	word = word.to_lower()
	
	pole1.hide()
	pole2.hide()
	pole3.hide()
	head.hide()
	body.hide()
	arm1.hide()
	arm2.hide()
	leg1.hide()
	leg2.hide()

func _process(_delta):
	
	word_label.text = word_label_text

func _damage():
	
	dmg_state = dmg_state + 1
	
	if dmg_state > 9:
		End_state_display.text = "PLAYER LOST"
		close_timer.start()
	
	if dmg_state == 1:
		pole1.show()
	elif dmg_state == 2:
		pole2.show()
	elif dmg_state == 3:
		pole3.show()
	elif dmg_state == 4:
		head.show()
	elif dmg_state == 5:
		body.show()
	elif dmg_state == 6:
		arm1.show()
	elif dmg_state == 7:
		arm2.show()
	elif dmg_state == 8:
		leg1.show()
	elif dmg_state == 9:
		leg2.show()

func _check_letter(letter):
	if letter in word:
		if letter in found_letters:
			pass
		else:
			word_temp = word
			var location_temp = 0
			for i in word.count(letter):
				
				location_temp = word_temp.find(letter, location_temp)
				#word_temp = word_temp.substr(location_temp)
				
				word_label_text = word_label_text.insert(location_temp, letter)
				
				#for l in location_temp:
					#word_label_text = word_label_text + underscore
				#word_label_text = word_label_text + letter + underscore.repeat(word.length() - location_temp - 1)
		
		found_letters.append(letter)
		
		if word == word_label_text:
			End_state_display.text = "PLAYER WIN"
			close_timer.start()
		
	else:
		_damage()

func _on_A_pressed():
	_check_letter("a")
func _on_B_pressed():
	_check_letter("b")
func _on_C_pressed():
	_check_letter("c")
func _on_D_pressed():
	_check_letter("d")
func _on_E_pressed():
	_check_letter("e")
func _on_F_pressed():
	_check_letter("f")
func _on_G_pressed():
	_check_letter("g")
func _on_H_pressed():
	_check_letter("h")
func _on_I_pressed():
	_check_letter("i")
func _on_J_pressed():
	_check_letter("j")
func _on_K_pressed():
	_check_letter("k")
func _on_L_pressed():
	_check_letter("l")
func _on_M_pressed():
	_check_letter("m")
func _on_N_pressed():
	_check_letter("n")
func _on_O_pressed():
	_check_letter("o")
func _on_P_pressed():
	_check_letter("p")
func _on_Q_pressed():
	_check_letter("q")
func _on_R_pressed():
	_check_letter("r")
func _on_S_pressed():
	_check_letter("s")
func _on_T_pressed():
	_check_letter("t")
func _on_U_pressed():
	_check_letter("u")
func _on_V_pressed():
	_check_letter("v")
func _on_W_pressed():
	_check_letter("w")
func _on_X_pressed():
	_check_letter("x")
func _on_Y_pressed():
	_check_letter("y")
func _on_Z_pressed():
	_check_letter("z")

func _on_Timer_timeout():
	word_temp = word
	word_label_text = underscore.repeat(word.length())

func _on_Close_timer_timeout():
	get_tree().quit()
