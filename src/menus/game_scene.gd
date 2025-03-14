extends Node

const CardButton = preload("res://src/entities/card_button.tscn")


func _ready() -> void:
	
#	TODO: Add the proper new day check
	if (true):
		$DailyEventPopup.show()
		$DailyEventPopup.grab_focus()
		return
	
	load_cards(GameManager.player)
	

func load_cards(player: Player) -> void:
	for i in range(player.current_cards.size()):
		var card_button = CardButton.instantiate()
		card_button.card = player.current_cards[i]
		if player.completed_cards[i]: card_button.mark_as_completed()
		$Cards.add_child(card_button)
	
		
	
	
#	
