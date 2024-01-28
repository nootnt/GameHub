extends Control

onready var status_label = $player_label/activity

var local_ships = []

var placement_mode = true
var ship_to_place

func shoot(index):
	if index in local_ships:
		$HBox/L/L_panel.get_child(index-1).add_stylebox_override("disabled", load("res://theme/bt_stylebox/red_styleboxflat.tres"))
		local_ships.erase(index)
		
		if local_ships.size() == 0:
			return [true, true]
		else:
			return [true, false]
	else:
		$HBox/L/L_panel.get_child(index-1).add_stylebox_override("disabled", load("res://theme/bt_stylebox/cyan_styleboxflat.tres"))
		return [false, false]

func _place_ship(index):
	
	if index == 0:
		for i in 10:
			var node = $HBox/L/L_panel.get_child(((i+1) * 10)-1) 
			node.disabled = true
		status_label.text = "Select your ship location : 2x size 2 horizontal"
		ship_to_place = 10
	elif index == -1:
		for i in 10:
			var node = $HBox/L/L_panel.get_child(((i+1) * 10)-1) 
			node.disabled = false
		for i in 10:
			var node = $HBox/L/L_panel.get_child(i) 
			node.disabled = true
	elif index == -2:
		for i in 10:
			var node = $HBox/L/L_panel.get_child(i) 
			node.disabled = false
	
	else:
		local_ships.append(index)
		
		if ship_to_place == 10:
			local_ships.append(index+1)
			ship_to_place = 9
			status_label.text = "Select your ship location : 1x size 2 horizontal"
		elif ship_to_place == 9:
			local_ships.append(index+1)
			ship_to_place = 8
			status_label.text = "Select your ship location : 2x size 2 vertical"
			_place_ship(-1)
		elif ship_to_place == 8:
			local_ships.append(index-10)
			ship_to_place = 7
			status_label.text = "Select your ship location : 1x size 2 vertical"
		elif ship_to_place == 7:
			local_ships.append(index-10)
			ship_to_place = 6
			status_label.text = "Select your ship location : "+str(ship_to_place)+"x size 1x1"
			_place_ship(-2)
		else:
			ship_to_place = ship_to_place - 1
			status_label.text = "Select your ship location : "+str(ship_to_place+4)+"x size 1x1"
			
		
		local_ships.sort()
		
		for i in local_ships:
			var node = $HBox/L/L_panel.get_child(i-1)
			node.disabled = true
			node.add_stylebox_override("disabled", load("res://theme/bt_stylebox/orange_styleboxflat.tres"))
		
		if ship_to_place == -4:
			status_label.text = "Choose where to shoot"
			placement_mode = false
			
			for button in $HBox/L/L_panel.get_children():
				button.disabled = true
				button.disconnect("pressed", self, str("on_pressed_"+button.name))
			for button in $HBox/R/R_panel.get_children():
				button.disabled = false
				button.connect("pressed", self, str("on_pressed_"+button.name))
			
			self.get_parent()._end_turn(1)

func _check_node(num):
	
	if placement_mode:
		_place_ship(num)
	else:
		var player2 = self.get_parent().get_node("player_2")
		var hit_win = []
		
		$HBox/R/R_panel.get_child(num-1).disabled = true
		
		hit_win = player2.shoot(num)
		
		if hit_win[0]:
			$HBox/R/R_panel.get_child(num-1).add_stylebox_override("disabled", load("res://theme/bt_stylebox/orange_styleboxflat.tres"))
		elif !(hit_win[0]):
			self.get_parent()._end_turn(1)
		if hit_win[1]:
			$win.visible = true
			$close_timer.start()

func _ready():
	
	for button in $HBox/L/L_panel.get_children():
		button.connect("pressed", self, str("on_pressed_"+button.name))
	
	_place_ship(0)
	

func on_pressed_btn1():
	_check_node(1)
func on_pressed_btn2():
	_check_node(2)
func on_pressed_btn3():
	_check_node(3)
func on_pressed_btn4():
	_check_node(4)
func on_pressed_btn5():
	_check_node(5)
func on_pressed_btn6():
	_check_node(6)
func on_pressed_btn7():
	_check_node(7)
func on_pressed_btn8():
	_check_node(8)
func on_pressed_btn9():
	_check_node(9)
func on_pressed_btn10():
	_check_node(10)
func on_pressed_btn11():
	_check_node(11)
func on_pressed_btn12():
	_check_node(12)
func on_pressed_btn13():
	_check_node(13)
func on_pressed_btn14():
	_check_node(14)
func on_pressed_btn15():
	_check_node(15)
func on_pressed_btn16():
	_check_node(16)
func on_pressed_btn17():
	_check_node(17)
func on_pressed_btn18():
	_check_node(18)
func on_pressed_btn19():
	_check_node(19)
func on_pressed_btn20():
	_check_node(20)
func on_pressed_btn21():
	_check_node(21)
func on_pressed_btn22():
	_check_node(22)
func on_pressed_btn23():
	_check_node(23)
func on_pressed_btn24():
	_check_node(24)
func on_pressed_btn25():
	_check_node(25)
func on_pressed_btn26():
	_check_node(26)
func on_pressed_btn27():
	_check_node(27)
func on_pressed_btn28():
	_check_node(28)
func on_pressed_btn29():
	_check_node(29)
func on_pressed_btn30():
	_check_node(30)
func on_pressed_btn31():
	_check_node(31)
func on_pressed_btn32():
	_check_node(32)
func on_pressed_btn33():
	_check_node(33)
func on_pressed_btn34():
	_check_node(34)
func on_pressed_btn35():
	_check_node(35)
func on_pressed_btn36():
	_check_node(36)
func on_pressed_btn37():
	_check_node(37)
func on_pressed_btn38():
	_check_node(38)
func on_pressed_btn39():
	_check_node(39)
func on_pressed_btn40():
	_check_node(40)
func on_pressed_btn41():
	_check_node(41)
func on_pressed_btn42():
	_check_node(42)
func on_pressed_btn43():
	_check_node(43)
func on_pressed_btn44():
	_check_node(44)
func on_pressed_btn45():
	_check_node(45)
func on_pressed_btn46():
	_check_node(46)
func on_pressed_btn47():
	_check_node(47)
func on_pressed_btn48():
	_check_node(48)
func on_pressed_btn49():
	_check_node(49)
func on_pressed_btn50():
	_check_node(50)
func on_pressed_btn51():
	_check_node(51)
func on_pressed_btn52():
	_check_node(52)
func on_pressed_btn53():
	_check_node(53)
func on_pressed_btn54():
	_check_node(54)
func on_pressed_btn55():
	_check_node(55)
func on_pressed_btn56():
	_check_node(56)
func on_pressed_btn57():
	_check_node(57)
func on_pressed_btn58():
	_check_node(58)
func on_pressed_btn59():
	_check_node(59)
func on_pressed_btn60():
	_check_node(60)
func on_pressed_btn61():
	_check_node(61)
func on_pressed_btn62():
	_check_node(62)
func on_pressed_btn63():
	_check_node(63)
func on_pressed_btn64():
	_check_node(64)
func on_pressed_btn65():
	_check_node(65)
func on_pressed_btn66():
	_check_node(66)
func on_pressed_btn67():
	_check_node(67)
func on_pressed_btn68():
	_check_node(68)
func on_pressed_btn69():
	_check_node(69)
func on_pressed_btn70():
	_check_node(70)
func on_pressed_btn71():
	_check_node(71)
func on_pressed_btn72():
	_check_node(72)
func on_pressed_btn73():
	_check_node(73)
func on_pressed_btn74():
	_check_node(74)
func on_pressed_btn75():
	_check_node(75)
func on_pressed_btn76():
	_check_node(76)
func on_pressed_btn77():
	_check_node(77)
func on_pressed_btn78():
	_check_node(78)
func on_pressed_btn79():
	_check_node(79)
func on_pressed_btn80():
	_check_node(80)
func on_pressed_btn81():
	_check_node(81)
func on_pressed_btn82():
	_check_node(82)
func on_pressed_btn83():
	_check_node(83)
func on_pressed_btn84():
	_check_node(84)
func on_pressed_btn85():
	_check_node(85)
func on_pressed_btn86():
	_check_node(86)
func on_pressed_btn87():
	_check_node(87)
func on_pressed_btn88():
	_check_node(88)
func on_pressed_btn89():
	_check_node(89)
func on_pressed_btn90():
	_check_node(90)
func on_pressed_btn91():
	_check_node(91)
func on_pressed_btn92():
	_check_node(92)
func on_pressed_btn93():
	_check_node(93)
func on_pressed_btn94():
	_check_node(94)
func on_pressed_btn95():
	_check_node(95)
func on_pressed_btn96():
	_check_node(96)
func on_pressed_btn97():
	_check_node(97)
func on_pressed_btn98():
	_check_node(98)
func on_pressed_btn99():
	_check_node(99)
func on_pressed_btn100():
	_check_node(100)

func _on_close_timer_timeout():
	get_tree().quit()
