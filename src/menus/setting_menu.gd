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
	print(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BackgroundMusic")))

func _on_sfxSlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), linear_to_db(value))
	print(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("")))
	
	



func _on_music_pressed() -> void:
	pass # Replace with function body.


func _on_logout_pressed() -> void:
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menus/home_menu.tscn")
