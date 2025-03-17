# this script is instantiate when start game and alive during scene changing (see Autoload)
extends Node

var player: Player
var deck: Deck

var auth: Dictionary

func _init() -> void:
	randomize()
	var cards: Array[Card] = CardUtils.cards.values()
	var events: Array[Event] = []
	self.deck = Deck.new(cards, events)

# this function should be called when the game scene is starting
# fetch player from firebase and select appropriate deck
func setup(player: Player) -> void:
	self.player = player

func get_player_id() -> String:
	return auth["localid"]

func has_player_id() -> bool:
	return auth.has("localid")

var settings_scene = "res://src/menus/setting_menu.tscn"  # Path to settings scene
var previous_scene = ""  # Stores the last scene before switching

func go_to_settings():
	if get_tree().current_scene.scene_file_path != settings_scene:
		previous_scene = get_tree().current_scene.scene_file_path  # Save the current scene
		get_tree().change_scene_to_file(settings_scene)
	else:
		return_to_previous_scene()

func return_to_previous_scene():
	if previous_scene != "":
		get_tree().change_scene_to_file(previous_scene)
