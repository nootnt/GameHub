extends Control

var dmg_state = 0
export var word: String = ""

var word_label_text: String = ""
var found_letters: Array = []

var underscore = "_"

onready var pole1 = $HBoxContainer/man_container/man/pole1
onready var pole2 = $HBoxContainer/man_container/man/pole2
onready var pole3 = $HBoxContainer/man_container/man/pole3
onready var head = $HBoxContainer/man_container/man/head
onready var body = $HBoxContainer/man_container/man/body
onready var arm1 = $HBoxContainer/man_container/man/arm1
onready var arm2 = $HBoxContainer/man_container/man/arm2
onready var leg1 = $HBoxContainer/man_container/man/leg1
onready var leg2 = $HBoxContainer/man_container/man/leg2

onready var word_label = $HBoxContainer/VBoxContainer/word_contrainer/word_label

onready var End_state_display = $End_state_display
onready var close_timer = $Close_timer

onready var a_btn = $HBoxContainer/VBoxContainer/keyboard/A
onready var b_btn = $HBoxContainer/VBoxContainer/keyboard/B
onready var c_btn = $HBoxContainer/VBoxContainer/keyboard/C
onready var d_btn = $HBoxContainer/VBoxContainer/keyboard/D
onready var e_btn = $HBoxContainer/VBoxContainer/keyboard/E
onready var f_btn = $HBoxContainer/VBoxContainer/keyboard/F
onready var g_btn = $HBoxContainer/VBoxContainer/keyboard/G
onready var h_btn = $HBoxContainer/VBoxContainer/keyboard/H
onready var i_btn = $HBoxContainer/VBoxContainer/keyboard/I
onready var j_btn = $HBoxContainer/VBoxContainer/keyboard/J
onready var k_btn = $HBoxContainer/VBoxContainer/keyboard/K
onready var l_btn = $HBoxContainer/VBoxContainer/keyboard/L
onready var m_btn = $HBoxContainer/VBoxContainer/keyboard/M
onready var n_btn = $HBoxContainer/VBoxContainer/keyboard/N
onready var o_btn = $HBoxContainer/VBoxContainer/keyboard/O
onready var p_btn = $HBoxContainer/VBoxContainer/keyboard/P
onready var q_btn = $HBoxContainer/VBoxContainer/keyboard/Q
onready var r_btn = $HBoxContainer/VBoxContainer/keyboard/R
onready var s_btn = $HBoxContainer/VBoxContainer/keyboard/S
onready var t_btn = $HBoxContainer/VBoxContainer/keyboard/T
onready var u_btn = $HBoxContainer/VBoxContainer/keyboard/U
onready var v_btn = $HBoxContainer/VBoxContainer/keyboard/V
onready var w_btn = $HBoxContainer/VBoxContainer/keyboard/W
onready var x_btn = $HBoxContainer/VBoxContainer/keyboard/X
onready var y_btn = $HBoxContainer/VBoxContainer/keyboard/Y
onready var z_btn = $HBoxContainer/VBoxContainer/keyboard/Z

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
	
	if dmg_state > 7:
		End_state_display.add_color_override("font_color", "#ff0000")
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
		arm2.show()
	elif dmg_state == 7:
		leg1.show()
		leg2.show()

func _check_letter(letter):
	if letter in word:
		if letter in found_letters:
			pass
		else:
			var word_temp = word
			var location_temp = 0
			for i in word.count(letter):
				
				# wtiring this next part gave me trauma
				
				location_temp = word_temp.find(letter)
				#print(location_temp)
				word_temp.erase(location_temp, 1)
				#print(word_temp)
				word_temp = word_temp.insert(location_temp, "_")
				#print(word_temp)
				
				word_label_text.erase(location_temp, 1)
				word_label_text = word_label_text.insert(location_temp, letter)
		
		found_letters.append(letter)
		
		if word == word_label_text:
			End_state_display.add_color_override("font_color", "#00ff00")
			End_state_display.text = "PLAYER WIN"
			close_timer.start()
		
		return true
		
	else:
		_damage()

func _on_A_pressed():
	_check_letter("a")
	a_btn.disabled = true
func _on_B_pressed():
	_check_letter("b")
	b_btn.disabled = true
func _on_C_pressed():
	_check_letter("c")
	c_btn.disabled = true
func _on_D_pressed():
	_check_letter("d")
	d_btn.disabled = true
func _on_E_pressed():
	_check_letter("e")
	e_btn.disabled = true
func _on_F_pressed():
	_check_letter("f")
	f_btn.disabled = true
func _on_G_pressed():
	_check_letter("g")
	g_btn.disabled = true
func _on_H_pressed():
	_check_letter("h")
	h_btn.disabled = true
func _on_I_pressed():
	_check_letter("i")
	i_btn.disabled = true
func _on_J_pressed():
	_check_letter("j")
	j_btn.disabled = true
func _on_K_pressed():
	_check_letter("k")
	k_btn.disabled = true
func _on_L_pressed():
	_check_letter("l")
	l_btn.disabled = true
func _on_M_pressed():
	_check_letter("m")
	m_btn.disabled = true
func _on_N_pressed():
	_check_letter("n")
	n_btn.disabled = true
func _on_O_pressed():
	_check_letter("o")
	o_btn.disabled = true
func _on_P_pressed():
	_check_letter("p")
	p_btn.disabled = true
func _on_Q_pressed():
	_check_letter("q")
	q_btn.disabled = true
func _on_R_pressed():
	_check_letter("r")
	r_btn.disabled = true
func _on_S_pressed():
	_check_letter("s")
	s_btn.disabled = true
func _on_T_pressed():
	_check_letter("t")
	t_btn.disabled = true
func _on_U_pressed():
	_check_letter("u")
	u_btn.disabled = true
func _on_V_pressed():
	_check_letter("v")
	v_btn.disabled = true
func _on_W_pressed():
	_check_letter("w")
	w_btn.disabled = true
func _on_X_pressed():
	_check_letter("x")
	x_btn.disabled = true
func _on_Y_pressed():
	_check_letter("y")
	y_btn.disabled = true
func _on_Z_pressed():
	_check_letter("z")
	z_btn.disabled = true

func _on_Timer_timeout():
	word_label_text = underscore.repeat(word.length())

func _on_Close_timer_timeout():
	get_tree().quit()
