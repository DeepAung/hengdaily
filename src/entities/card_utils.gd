extends Node
class_name CardUtils


#TODO: Add cards
enum {
	TEST_CARD
}


#TODO: Add cards
static var cards = {
	TEST_CARD: [
		"Test", 
		"The best card",
		SpriteUtils.Inner.TEST,
		SpriteUtils.Frame.PINK,
		[SpriteUtils.Icon.LOVE, SpriteUtils.Icon.BAD_STUDY],
		func(player: Player) -> void: pass
	]
}


static func get_card_property(card: int) -> Array:
	return cards[card]


static func get_card(card: int) -> Card:
	var card_property = get_card_property(card)
	return Card.new(
		card_property[0],
		card_property[1],
		card_property[2],
		card_property[3],
		card_property[4],
		card_property[5]
	)
