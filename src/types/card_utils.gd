extends Node
class_name CardUtils


#TODO: Add cards
enum {
	TEST_CARD
}

#Might be a better way
const enum_size = 1

#TODO: Add cards
static var cards: Dictionary[int, Card] = {
	TEST_CARD: NormalCard.new(
		"Test", 
		"The best card", 
		SpriteUtils.Inner.TEST, 
		SpriteUtils.Frame.PINK, 
		[SpriteUtils.Icon.LOVE, SpriteUtils.Icon.BAD_STUDY], 
		5, -5, 0, 0
	),
}

static func get_card(index: int) -> Card:
	return cards[index]
