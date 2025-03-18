extends VBoxContainer

func set_display(name: String, description: String) -> void:
	$Name.text = name
	$Description.text = description


func _on_close_button_pressed() -> void:
	self.hide()
