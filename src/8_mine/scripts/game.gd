extends Control

var random = RandomNumberGenerator.new()

export var bombs_percentage: int = 20
var bombs_count
var flag_count

var bombs_list = []
var flags_list = []

var flag_mode = false

func free_node(index, propagating):
	
	var pressed_btn = $grid.get_child(index-1)
	
	if (index >= 1 && 400 >= index && !(pressed_btn.disabled)):
		var current_bomb_cnt = 0
		var surroundings = [index-21, index-20, index-19, index-1, index+1, index+19, index+20, index+21]
		
		if index in [1, 21, 41, 61, 81, 101, 121, 141, 161, 181, 201, 221, 241, 261, 281, 301, 321, 341, 361, 381]:
			surroundings = [index-20, index-19, index+1, index+20, index+21]
		elif index in [20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 340, 360, 380, 400]:
			surroundings = [index-21, index-20, index-1, index+19, index+20]
		
		for i in surroundings:
			if i in bombs_list:
				current_bomb_cnt = current_bomb_cnt + 1
				if propagating:
					yield(get_tree().create_timer(0.05), "timeout")
		
		if current_bomb_cnt == 0:
			pressed_btn.disabled = true
			pressed_btn.add_color_override("font_color_disabled", "#0D0D0D")
			pressed_btn.text = "0"
			
			for i in surroundings:
				yield(get_tree().create_timer(0.1), "timeout")
				free_node(i, true)
			
		else:
			pressed_btn.disabled = true
			pressed_btn.text = str(current_bomb_cnt)

func _check_node(index):
	
	var pressed_btn = $grid.get_child(index-1)
	
	if !flag_mode:
		if (index >= 1 && 400 >= index):
			if !(index in flags_list):
				if index in bombs_list:
					pressed_btn.disabled = true
					pressed_btn.text = ""
					pressed_btn.icon = load("res://bomb_sign.png")
					$end_state_display.add_color_override("font_color", "#ff0000")
					$end_state_display.text = "YOU DIED"
					$end_state_display.visible = true
					$close_timer.start()
				
				else:
					free_node(index, false)
	
	else:
		
		if flag_count > 0:
			if index in flags_list:
				
				flags_list.remove(flags_list.find(index))
				flags_list.sort()
				
				pressed_btn.icon = load("")
				pressed_btn.text = "8"
				pressed_btn.add_stylebox_override("normal", load("res://theme/bt_stylebox/normal_styleboxflat.tres"))
				pressed_btn.add_stylebox_override("hover", load("res://theme/bt_stylebox/hover_styleboxflat.tres"))
				
				flag_count = flag_count + 1 
				
			else:
				
				flags_list.append(index)
				flags_list.sort()
				
				pressed_btn.icon = load("res://bomb_flag.png")
				pressed_btn.text = ""
				pressed_btn.add_stylebox_override("normal", load("res://theme/bt_stylebox/styleboxempty.tres"))
				pressed_btn.add_stylebox_override("hover", load("res://theme/bt_stylebox/styleboxempty.tres"))
				
				flag_count = flag_count - 1
				
				if flags_list == bombs_list:
					
					$end_state_display.add_color_override("font_color", "#00ff00")
					$end_state_display.text = "YOU WIN"
					$end_state_display.visible = true
					$close_timer.start()
		$flag_indicator/flag_count.text = str(flag_count)

func _initialize():
	random.randomize()
	bombs_count = bombs_percentage * 4
	$bomb_indicator/bomb_count.text = str(bombs_count)
	flag_count = bombs_count
	$flag_indicator/flag_count.text = str(flag_count)
	
	for i in bombs_count:
		random.randomize()
		var num = random.randi_range(1, 400)
		while num in bombs_list:
			num = random.randi_range(1, 400)
		bombs_list.append(num)
	
	bombs_list.sort()
	
	for button in $grid.get_children():
		button.connect("pressed", self, str("on_pressed_"+button.name))

func _on_init_timer_timeout():
	_initialize()

func _on_close_timer_timeout():
	get_tree().quit()

func _on_CheckBox_toggled(button_pressed):
	if flag_mode == true:
		flag_mode = false
	else:
		flag_mode = true

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
func on_pressed_btn101():
	_check_node(101)
func on_pressed_btn102():
	_check_node(102)
func on_pressed_btn103():
	_check_node(103)
func on_pressed_btn104():
	_check_node(104)
func on_pressed_btn105():
	_check_node(105)
func on_pressed_btn106():
	_check_node(106)
func on_pressed_btn107():
	_check_node(107)
func on_pressed_btn108():
	_check_node(108)
func on_pressed_btn109():
	_check_node(109)
func on_pressed_btn110():
	_check_node(110)
func on_pressed_btn111():
	_check_node(111)
func on_pressed_btn112():
	_check_node(112)
func on_pressed_btn113():
	_check_node(113)
func on_pressed_btn114():
	_check_node(114)
func on_pressed_btn115():
	_check_node(115)
func on_pressed_btn116():
	_check_node(116)
func on_pressed_btn117():
	_check_node(117)
func on_pressed_btn118():
	_check_node(118)
func on_pressed_btn119():
	_check_node(119)
func on_pressed_btn120():
	_check_node(120)
func on_pressed_btn121():
	_check_node(121)
func on_pressed_btn122():
	_check_node(122)
func on_pressed_btn123():
	_check_node(123)
func on_pressed_btn124():
	_check_node(124)
func on_pressed_btn125():
	_check_node(125)
func on_pressed_btn126():
	_check_node(126)
func on_pressed_btn127():
	_check_node(127)
func on_pressed_btn128():
	_check_node(128)
func on_pressed_btn129():
	_check_node(129)
func on_pressed_btn130():
	_check_node(130)
func on_pressed_btn131():
	_check_node(131)
func on_pressed_btn132():
	_check_node(132)
func on_pressed_btn133():
	_check_node(133)
func on_pressed_btn134():
	_check_node(134)
func on_pressed_btn135():
	_check_node(135)
func on_pressed_btn136():
	_check_node(136)
func on_pressed_btn137():
	_check_node(137)
func on_pressed_btn138():
	_check_node(138)
func on_pressed_btn139():
	_check_node(139)
func on_pressed_btn140():
	_check_node(140)
func on_pressed_btn141():
	_check_node(141)
func on_pressed_btn142():
	_check_node(142)
func on_pressed_btn143():
	_check_node(143)
func on_pressed_btn144():
	_check_node(144)
func on_pressed_btn145():
	_check_node(145)
func on_pressed_btn146():
	_check_node(146)
func on_pressed_btn147():
	_check_node(147)
func on_pressed_btn148():
	_check_node(148)
func on_pressed_btn149():
	_check_node(149)
func on_pressed_btn150():
	_check_node(150)
func on_pressed_btn151():
	_check_node(151)
func on_pressed_btn152():
	_check_node(152)
func on_pressed_btn153():
	_check_node(153)
func on_pressed_btn154():
	_check_node(154)
func on_pressed_btn155():
	_check_node(155)
func on_pressed_btn156():
	_check_node(156)
func on_pressed_btn157():
	_check_node(157)
func on_pressed_btn158():
	_check_node(158)
func on_pressed_btn159():
	_check_node(159)
func on_pressed_btn160():
	_check_node(160)
func on_pressed_btn161():
	_check_node(161)
func on_pressed_btn162():
	_check_node(162)
func on_pressed_btn163():
	_check_node(163)
func on_pressed_btn164():
	_check_node(164)
func on_pressed_btn165():
	_check_node(165)
func on_pressed_btn166():
	_check_node(166)
func on_pressed_btn167():
	_check_node(167)
func on_pressed_btn168():
	_check_node(168)
func on_pressed_btn169():
	_check_node(169)
func on_pressed_btn170():
	_check_node(170)
func on_pressed_btn171():
	_check_node(171)
func on_pressed_btn172():
	_check_node(172)
func on_pressed_btn173():
	_check_node(173)
func on_pressed_btn174():
	_check_node(174)
func on_pressed_btn175():
	_check_node(175)
func on_pressed_btn176():
	_check_node(176)
func on_pressed_btn177():
	_check_node(177)
func on_pressed_btn178():
	_check_node(178)
func on_pressed_btn179():
	_check_node(179)
func on_pressed_btn180():
	_check_node(180)
func on_pressed_btn181():
	_check_node(181)
func on_pressed_btn182():
	_check_node(182)
func on_pressed_btn183():
	_check_node(183)
func on_pressed_btn184():
	_check_node(184)
func on_pressed_btn185():
	_check_node(185)
func on_pressed_btn186():
	_check_node(186)
func on_pressed_btn187():
	_check_node(187)
func on_pressed_btn188():
	_check_node(188)
func on_pressed_btn189():
	_check_node(189)
func on_pressed_btn190():
	_check_node(190)
func on_pressed_btn191():
	_check_node(191)
func on_pressed_btn192():
	_check_node(192)
func on_pressed_btn193():
	_check_node(193)
func on_pressed_btn194():
	_check_node(194)
func on_pressed_btn195():
	_check_node(195)
func on_pressed_btn196():
	_check_node(196)
func on_pressed_btn197():
	_check_node(197)
func on_pressed_btn198():
	_check_node(198)
func on_pressed_btn199():
	_check_node(199)
func on_pressed_btn200():
	_check_node(200)
func on_pressed_btn201():
	_check_node(201)
func on_pressed_btn202():
	_check_node(202)
func on_pressed_btn203():
	_check_node(203)
func on_pressed_btn204():
	_check_node(204)
func on_pressed_btn205():
	_check_node(205)
func on_pressed_btn206():
	_check_node(206)
func on_pressed_btn207():
	_check_node(207)
func on_pressed_btn208():
	_check_node(208)
func on_pressed_btn209():
	_check_node(209)
func on_pressed_btn210():
	_check_node(210)
func on_pressed_btn211():
	_check_node(211)
func on_pressed_btn212():
	_check_node(212)
func on_pressed_btn213():
	_check_node(213)
func on_pressed_btn214():
	_check_node(214)
func on_pressed_btn215():
	_check_node(215)
func on_pressed_btn216():
	_check_node(216)
func on_pressed_btn217():
	_check_node(217)
func on_pressed_btn218():
	_check_node(218)
func on_pressed_btn219():
	_check_node(219)
func on_pressed_btn220():
	_check_node(220)
func on_pressed_btn221():
	_check_node(221)
func on_pressed_btn222():
	_check_node(222)
func on_pressed_btn223():
	_check_node(223)
func on_pressed_btn224():
	_check_node(224)
func on_pressed_btn225():
	_check_node(225)
func on_pressed_btn226():
	_check_node(226)
func on_pressed_btn227():
	_check_node(227)
func on_pressed_btn228():
	_check_node(228)
func on_pressed_btn229():
	_check_node(229)
func on_pressed_btn230():
	_check_node(230)
func on_pressed_btn231():
	_check_node(231)
func on_pressed_btn232():
	_check_node(232)
func on_pressed_btn233():
	_check_node(233)
func on_pressed_btn234():
	_check_node(234)
func on_pressed_btn235():
	_check_node(235)
func on_pressed_btn236():
	_check_node(236)
func on_pressed_btn237():
	_check_node(237)
func on_pressed_btn238():
	_check_node(238)
func on_pressed_btn239():
	_check_node(239)
func on_pressed_btn240():
	_check_node(240)
func on_pressed_btn241():
	_check_node(241)
func on_pressed_btn242():
	_check_node(242)
func on_pressed_btn243():
	_check_node(243)
func on_pressed_btn244():
	_check_node(244)
func on_pressed_btn245():
	_check_node(245)
func on_pressed_btn246():
	_check_node(246)
func on_pressed_btn247():
	_check_node(247)
func on_pressed_btn248():
	_check_node(248)
func on_pressed_btn249():
	_check_node(249)
func on_pressed_btn250():
	_check_node(250)
func on_pressed_btn251():
	_check_node(251)
func on_pressed_btn252():
	_check_node(252)
func on_pressed_btn253():
	_check_node(253)
func on_pressed_btn254():
	_check_node(254)
func on_pressed_btn255():
	_check_node(255)
func on_pressed_btn256():
	_check_node(256)
func on_pressed_btn257():
	_check_node(257)
func on_pressed_btn258():
	_check_node(258)
func on_pressed_btn259():
	_check_node(259)
func on_pressed_btn260():
	_check_node(260)
func on_pressed_btn261():
	_check_node(261)
func on_pressed_btn262():
	_check_node(262)
func on_pressed_btn263():
	_check_node(263)
func on_pressed_btn264():
	_check_node(264)
func on_pressed_btn265():
	_check_node(265)
func on_pressed_btn266():
	_check_node(266)
func on_pressed_btn267():
	_check_node(267)
func on_pressed_btn268():
	_check_node(268)
func on_pressed_btn269():
	_check_node(269)
func on_pressed_btn270():
	_check_node(270)
func on_pressed_btn271():
	_check_node(271)
func on_pressed_btn272():
	_check_node(272)
func on_pressed_btn273():
	_check_node(273)
func on_pressed_btn274():
	_check_node(274)
func on_pressed_btn275():
	_check_node(275)
func on_pressed_btn276():
	_check_node(276)
func on_pressed_btn277():
	_check_node(277)
func on_pressed_btn278():
	_check_node(278)
func on_pressed_btn279():
	_check_node(279)
func on_pressed_btn280():
	_check_node(280)
func on_pressed_btn281():
	_check_node(281)
func on_pressed_btn282():
	_check_node(282)
func on_pressed_btn283():
	_check_node(283)
func on_pressed_btn284():
	_check_node(284)
func on_pressed_btn285():
	_check_node(285)
func on_pressed_btn286():
	_check_node(286)
func on_pressed_btn287():
	_check_node(287)
func on_pressed_btn288():
	_check_node(288)
func on_pressed_btn289():
	_check_node(289)
func on_pressed_btn290():
	_check_node(290)
func on_pressed_btn291():
	_check_node(291)
func on_pressed_btn292():
	_check_node(292)
func on_pressed_btn293():
	_check_node(293)
func on_pressed_btn294():
	_check_node(294)
func on_pressed_btn295():
	_check_node(295)
func on_pressed_btn296():
	_check_node(296)
func on_pressed_btn297():
	_check_node(297)
func on_pressed_btn298():
	_check_node(298)
func on_pressed_btn299():
	_check_node(299)
func on_pressed_btn300():
	_check_node(300)
func on_pressed_btn301():
	_check_node(301)
func on_pressed_btn302():
	_check_node(302)
func on_pressed_btn303():
	_check_node(303)
func on_pressed_btn304():
	_check_node(304)
func on_pressed_btn305():
	_check_node(305)
func on_pressed_btn306():
	_check_node(306)
func on_pressed_btn307():
	_check_node(307)
func on_pressed_btn308():
	_check_node(308)
func on_pressed_btn309():
	_check_node(309)
func on_pressed_btn310():
	_check_node(310)
func on_pressed_btn311():
	_check_node(311)
func on_pressed_btn312():
	_check_node(312)
func on_pressed_btn313():
	_check_node(313)
func on_pressed_btn314():
	_check_node(314)
func on_pressed_btn315():
	_check_node(315)
func on_pressed_btn316():
	_check_node(316)
func on_pressed_btn317():
	_check_node(317)
func on_pressed_btn318():
	_check_node(318)
func on_pressed_btn319():
	_check_node(319)
func on_pressed_btn320():
	_check_node(320)
func on_pressed_btn321():
	_check_node(321)
func on_pressed_btn322():
	_check_node(322)
func on_pressed_btn323():
	_check_node(323)
func on_pressed_btn324():
	_check_node(324)
func on_pressed_btn325():
	_check_node(325)
func on_pressed_btn326():
	_check_node(326)
func on_pressed_btn327():
	_check_node(327)
func on_pressed_btn328():
	_check_node(328)
func on_pressed_btn329():
	_check_node(329)
func on_pressed_btn330():
	_check_node(330)
func on_pressed_btn331():
	_check_node(331)
func on_pressed_btn332():
	_check_node(332)
func on_pressed_btn333():
	_check_node(333)
func on_pressed_btn334():
	_check_node(334)
func on_pressed_btn335():
	_check_node(335)
func on_pressed_btn336():
	_check_node(336)
func on_pressed_btn337():
	_check_node(337)
func on_pressed_btn338():
	_check_node(338)
func on_pressed_btn339():
	_check_node(339)
func on_pressed_btn340():
	_check_node(340)
func on_pressed_btn341():
	_check_node(341)
func on_pressed_btn342():
	_check_node(342)
func on_pressed_btn343():
	_check_node(343)
func on_pressed_btn344():
	_check_node(344)
func on_pressed_btn345():
	_check_node(345)
func on_pressed_btn346():
	_check_node(346)
func on_pressed_btn347():
	_check_node(347)
func on_pressed_btn348():
	_check_node(348)
func on_pressed_btn349():
	_check_node(349)
func on_pressed_btn350():
	_check_node(350)
func on_pressed_btn351():
	_check_node(351)
func on_pressed_btn352():
	_check_node(352)
func on_pressed_btn353():
	_check_node(353)
func on_pressed_btn354():
	_check_node(354)
func on_pressed_btn355():
	_check_node(355)
func on_pressed_btn356():
	_check_node(356)
func on_pressed_btn357():
	_check_node(357)
func on_pressed_btn358():
	_check_node(358)
func on_pressed_btn359():
	_check_node(359)
func on_pressed_btn360():
	_check_node(360)
func on_pressed_btn361():
	_check_node(361)
func on_pressed_btn362():
	_check_node(362)
func on_pressed_btn363():
	_check_node(363)
func on_pressed_btn364():
	_check_node(364)
func on_pressed_btn365():
	_check_node(365)
func on_pressed_btn366():
	_check_node(366)
func on_pressed_btn367():
	_check_node(367)
func on_pressed_btn368():
	_check_node(368)
func on_pressed_btn369():
	_check_node(369)
func on_pressed_btn370():
	_check_node(370)
func on_pressed_btn371():
	_check_node(371)
func on_pressed_btn372():
	_check_node(372)
func on_pressed_btn373():
	_check_node(373)
func on_pressed_btn374():
	_check_node(374)
func on_pressed_btn375():
	_check_node(375)
func on_pressed_btn376():
	_check_node(376)
func on_pressed_btn377():
	_check_node(377)
func on_pressed_btn378():
	_check_node(378)
func on_pressed_btn379():
	_check_node(379)
func on_pressed_btn380():
	_check_node(380)
func on_pressed_btn381():
	_check_node(381)
func on_pressed_btn382():
	_check_node(382)
func on_pressed_btn383():
	_check_node(383)
func on_pressed_btn384():
	_check_node(384)
func on_pressed_btn385():
	_check_node(385)
func on_pressed_btn386():
	_check_node(386)
func on_pressed_btn387():
	_check_node(387)
func on_pressed_btn388():
	_check_node(388)
func on_pressed_btn389():
	_check_node(389)
func on_pressed_btn390():
	_check_node(390)
func on_pressed_btn391():
	_check_node(391)
func on_pressed_btn392():
	_check_node(392)
func on_pressed_btn393():
	_check_node(393)
func on_pressed_btn394():
	_check_node(394)
func on_pressed_btn395():
	_check_node(395)
func on_pressed_btn396():
	_check_node(396)
func on_pressed_btn397():
	_check_node(397)
func on_pressed_btn398():
	_check_node(398)
func on_pressed_btn399():
	_check_node(399)
func on_pressed_btn400():
	_check_node(400)
