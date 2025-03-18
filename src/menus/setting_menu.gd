extends Control
@onready var backgroundMusicSlider: Slider = %bgMusic_slider;
@onready var sfxSlider: Slider = %sfx_slider;
func _ready():
	backgroundMusicSlider.value = db_to_linear(
		AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BackgroundMusic"))
	)
	sfxSlider.value = db_to_linear(
		AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sfx"))
	)
	
func _on_BackgroundMusicSlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BackgroundMusic"), linear_to_db(value))
	#print(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BackgroundMusic")))

func _on_sfxSlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), linear_to_db(value))
	#print(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("")))


func _on_logout_pressed() -> void:
	$Click.play()
	

func _on_logout_mouse_entered() -> void:
	$"Hover-card".play()


func _on_back_pressed() -> void:
	$Click.play()
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.01
	timer.one_shot = true
	timer.start()
	await timer.timeout
	GameManager.return_to_previous_scene()

func _on_back_mouse_entered() -> void:
	$"Hover-card".play()
	
func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		GameManager.return_to_previous_scene()
