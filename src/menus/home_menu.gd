extends Control

var isWeb : bool = Utilities.is_web();
# มี 2 ที่ : auth_manager.gd กับใน home_menu.gd
# usage : _on_quit_pressed()


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
	if (isWeb):
		JavaScriptBridge.eval("localStorage.removeItem('auth_token');")
		print("User signed out.")
	else :
		Firebase.Auth.logout()
	
	get_tree().change_scene_to_file("res://src/menus/signin_menu.tscn")
	#get_tree().quit()
	
func _on_quit_mouse_entered() -> void:
	$"Hover-card".play()

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		GameManager.go_to_settings()
