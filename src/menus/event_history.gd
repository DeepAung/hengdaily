extends Control


func _on_event_history_button_pressed() -> void:
	$EventHistoryList.visible = !$EventHistoryList.visible

func set_events(events: Array[Event]):
	for node in $EventHistoryList/VBoxContainer.get_children():
		node.queue_free()
	for i in range(len(events)-1, -1, -1):
		var event = events[i]
		var node = $DummyEvent.duplicate()
		node.get_child(0).text = event.display_name
		node.get_child(1).text = event.description
		node.show()
		$EventHistoryList/VBoxContainer.add_child(node)
