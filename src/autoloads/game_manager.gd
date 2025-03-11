class_name GameManager
extends Node

var player: Player
var deck: Deck
var current_cards: Array[Card]
var event_history: Array[Event]

# TODO: randomize() on ready in scene
func _init(player: Player, deck: Deck) -> void:
	self.player = player
	self.deck = deck
	self.current_cards = []
	self.event_history = []

func get_current_event() -> Event:
	if len(self.event_history) == 0:
		return null
	return self.event_history[len(self.event_history) - 1]
