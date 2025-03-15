extends Control


func _on_play_pressed() -> void:
	$Click.play()
	
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.01
	timer.one_shot = true
	timer.start()
	await timer.timeout
	get_tree().change_scene_to_file("res://src/menus/game_scene.tscn")
	
func _on_play_mouse_entered() -> void:
	$"Hover-card".play()

func _on_setting_pressed() -> void:
	$Click.play()
	# Make wait time so the click sound is playing lol
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.01
	timer.one_shot = true
	timer.start()
	await timer.timeout
	get_tree().change_scene_to_file("res://src/menus/setting_menu.tscn")

func _on_setting_mouse_entered() -> void:
	$"Hover-card".play()

func _on_quit_pressed() -> void:
	$Click.play()
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.1
	timer.one_shot = true
	timer.start()
	await timer.timeout
	Firebase.Auth.logout()
	get_tree().change_scene_to_file("res://src/menus/authentication_menu.tscn")
	#get_tree().quit()
	
func _on_quit_mouse_entered() -> void:
	$"Hover-card".play()
