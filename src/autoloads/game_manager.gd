class_name GameManager
extends Node

var player: Player
var deck: Deck


# TODO: randomize() on ready in scene
func _init(player: Player, deck: Deck) -> void:
	self.player = player
	self.deck = deck
	self.current_cards = []
	self.event_history = []
