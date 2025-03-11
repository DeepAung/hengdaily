class_name Deck
extends Node

var cards: Array[Card]
var events: Array[Event]

func _init(cards: Array[Card], events: Array[Event]) -> void:
	self.cards = cards
	self.events = events

func pick_cards(n: int) -> Array[Card]:
	var available_cards = []
	for item: Card in self.cards:
		available_cards.append(item)

	var result_cards = []
	for i in range(n):
		var index = randi_range(0, len(available_cards)-1)
		var card = available_cards[index]
		available_cards.remove_at(index)
		result_cards.append(card)

	return result_cards

func pick_event() -> Event:
	return self.events[randi_range(0, len(self.events)-1)]
