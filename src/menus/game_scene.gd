extends Node

const CardButton = preload("res://src/entities/card_button.tscn")

func _init() -> void:
	# Dummy data to check if the game is working
	var player = Player.new(1, "Haminic", 19, 4, 1)
	player.add_love(50)
	player.add_study(-50)
	player.add_money(1000)
	player.add_health(30)
	var cards = CardUtils.cards.values()
	var events: Array[Event] = []
	var deck = Deck.new(cards, events)
	GameManager.setup(player, deck)

func _ready() -> void:
	
#	TODO: v Add the proper new day check instead of true
	if (true):
		$DailyEventPopup.show()
#		TODO: Focus to DailyEventPopup and once it's closed, randomize 3 new cards to the player's current_cards, 
#		      then play the draw card animation using play_draw_animation. And then once all the card moving is 
#		      done, spawn a Control node with all the cards face-down. On the node (probably needs to be a 
#		      separate scene or using the existing CardButton scene), have the click event trigger play the card
#		      flip animation (flip to the corresponding card texture(s) that was randomized after the DailyEventPopup
		return
	
	$LuckChart.set_luck_values(GameManager.player.luck_love, GameManager.player.luck_money, GameManager.player.luck_health, GameManager.player.luck_study)
	load_cards(GameManager.player)
	

func load_cards(player: Player) -> void:
	for i in range(player.current_cards.size()):
		var card_button = CardButton.instantiate()
		card_button.card = player.current_cards[i]
		if player.completed_cards[i]: card_button.mark_as_completed()
		$Cards.add_child(card_button)
	

#TODO: Create an instance of a Node2D with proper textures of the cards (face down) and 
#      move it from the card deck to the location on the screen
func play_draw_animation(location: Vector2) -> void:
	pass
