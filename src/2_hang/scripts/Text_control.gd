extends LineEdit

var allowed_characters = "[A-Za-z]"

func _on_Textbox_text_changed(new_text):
	var old_caret_position = self.caret_position
	
	var word = ''
	var regex = RegEx.new()
	regex.compile(allowed_characters)
	for valid_character in regex.search_all(new_text):
		word += valid_character.get_string()
	self.set_text(word)
	
	caret_position = old_caret_position

func _on_CheckButton_toggled(button_pressed):
	if self.secret == false:
		self.secret = true
	else:
		self.secret = false
