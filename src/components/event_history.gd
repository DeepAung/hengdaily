extends Node


func _ready() -> void:
	$Panel.hide()


func _on_event_history_button_pressed() -> void:
	$Panel.visible = !$Panel.visible
	if ($Panel.visible):
		$EventHistoryButton.text = "Close Event History"
	else:
		$EventHistoryButton.text = "Open Event History"

func set_events(events: Array[Event]):
	for node in %VBoxContainer.get_children():
		node.queue_free()
	for i in range(len(events)-1, -1, -1):
		var event = events[i]
		var node = $DummyEvent.duplicate()
		node.get_child(0).text = event.display_name
		node.get_child(1).text = event.description
		node.show()
		%VBoxContainer.add_child(node)
