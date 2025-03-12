extends Button

var card: Card

func _init(card: Card) -> void:
	self.card = card
	$FrameTexture.texture = card.frame_texture
	$InnerTexture.texture = card.inner_texture
	
	for icon in card.icon_list:
#		put the icon somewhere
		pass
	
	$Label.text = card.name
	$CardDescription.set_description(card.description)


func _on_mouse_entered() -> void:
	$CardDescription.visible = true


func _on_mouse_exited() -> void:
	$CardDescription.visible = false
