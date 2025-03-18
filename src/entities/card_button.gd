extends Button
class_name CardButton

var card: Card #Remove?
var completed: bool = false


func _init() -> void:
	hide()


func _ready() -> void:
	$FrameTexture.texture = card.frame_texture
	$InnerTexture.texture = card.inner_texture
	
	for icon in card.icon_texture_list:
#		put the icon somewhere
		pass
	
	$Label.text = card.name
	$CardDescription.set_description(card.description)
	show()


func mark_as_completed() -> void:
	completed = true
	$CompletedOverlay.show()


func _on_mouse_entered() -> void:
	if not completed:
		$CardDescription.visible = true


func _on_mouse_exited() -> void:
	if not completed:
		$CardDescription.visible = false
