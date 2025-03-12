extends Control



func _on_play_pressed() -> void:
	print("PLAYED")


func _on_setting_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menus/setting_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
