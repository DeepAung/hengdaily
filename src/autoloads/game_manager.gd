# this script is instantiate when start game and alive during scene changing (see Autoload)
extends Node

var player: Player
var deck: Deck

func _init() -> void:
	randomize()

# this function should be called when the game scene is starting
# fetch player from firebase and select appropriate deck
func setup(player: Player, deck: Deck) -> void:
	self.player = player
	self.deck = deck
