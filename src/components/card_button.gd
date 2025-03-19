extends Button
class_name CardButton

var card: Card = CardUtils.cards[0]
@export var completed: bool = false:
	set(value): # setter of completed
		completed = value
		$CompletedOverlay.visible = completed

@export var frame_texture: Texture2D
@export var inner_texture: Texture2D
@export var icon_texture_list: Array[Texture2D]
@export var completed_overlay: Texture2D


func setup(card: Card, completed: bool) -> void:
	self.card = card
	self.completed = completed
	self.frame_texture = card.frame_texture
	self.inner_texture = card.inner_texture
	self.icon_texture_list = card.icon_texture_list

	$FrameTexture.texture = self.frame_texture
	$InnerTexture.texture = self.inner_texture
	
	for node in $IconList.get_children():
		node.queue_free()
	for icon in self.icon_texture_list:
		var node = TextureRect.new()
		node.texture = icon
		$IconList.add_child(node)
	
	show()

# for debug purpose only
func _ready() -> void:
	$FrameTexture.texture = self.frame_texture
	$InnerTexture.texture = self.inner_texture
	
	for node in $IconList.get_children():
		node.queue_free()
	for icon in self.icon_texture_list:
		var node = TextureRect.new()
		node.texture = icon
		$IconList.add_child(node)


func _on_mouse_entered() -> void:
	if completed:
		return
	$HoverOverlay.show()
	SignalBus.card_button_hover.emit(true, self.card.display_name, self.card.description)

func _on_mouse_exited() -> void:
	if completed:
		return
	$HoverOverlay.hide()
	SignalBus.card_button_hover.emit(false, self.card.display_name, self.card.description)


func _on_pressed() -> void:
	if completed:
		return
	print("card button pressed")
	var index = int(str(self.name)[-1]) - 1 # get index=0 from "CardButton1"
	SignalBus.card_button_clicked.emit(index)
