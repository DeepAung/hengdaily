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
