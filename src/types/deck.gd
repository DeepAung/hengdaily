class_name Deck
extends Node

var cards: Array[Card]
var card_is_completed: Array[bool]
var events: Array[Event]

func _init(cards: Array[Card], events: Array[Event]) -> void:
	self.cards = cards
	self.card_is_completed = []
	for i in range(len(self.cards)):
		self.card_is_completed.append(false)
	self.events = events

func pick_cards(n: int) -> Array[Card]:
	var tmp_cards = self.cards.duplicate(false)
	tmp_cards.shuffle()
	return tmp_cards.slice(0, n)

func pick_event() -> Event:
	return self.events[randi_range(0, len(self.events)-1)]
