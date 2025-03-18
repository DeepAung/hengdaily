extends Node

const CardButton = preload("res://src/entities/card_button.tscn")

signal _init_finished

func _init() -> void:
	var player_id = GameManager.get_player_id()
	var doc: FirestoreDocument = await Firebase.Firestore.collection("players").get_doc(player_id)
	var player = Player.document_to_player(doc)
	GameManager.setup(player)
	_init_finished.emit()



func _ready() -> void:
	await _init_finished
	
	var last_login = Time.get_datetime_dict_from_unix_time(GameManager.player.last_login_unix)
	var today =  Time.get_datetime_dict_from_system()
	var new_day: bool = GameManager.greater_date(today, last_login)
	var current_event: Event = null;
	if (new_day):
		GameManager.player.last_login_unix = Time.get_unix_time_from_datetime_dict(today)
		current_event = GameManager.deck.pick_event()
		GameManager.player.event_history.append(current_event)
		
		# show popup
		$DailyEventPopup.set_display(current_event.display_name, current_event.description)
		$DailyEventPopup.show()
		
		# update player object in Firestore
		var update_doc = FirestoreDocument.new()
		var player_dict = Player.player_to_dictionary(GameManager.player)
		update_doc.doc_name = player_dict.id
		update_doc.add_or_update_field("event_index_history", player_dict.event_index_history)
		update_doc.add_or_update_field("last_login_unix", player_dict.last_login_unix)
		await Firebase.Firestore.collection("players").update(update_doc)

#		TODO: Focus to DailyEventPopup and once it's closed, randomize 3 new cards to the player's current_cards, 
#		      then play the draw card animation using play_draw_animation. And then once all the card moving is 
#		      done, spawn a Control node with all the cards face-down. On the node (probably needs to be a 
#		      separate scene or using the existing CardButton scene), have the click event trigger play the card
#		      flip animation (flip to the corresponding card texture(s) that was randomized after the DailyEventPopup
	else:
		current_event = GameManager.player.get_latest_event()
		$DailyEventPopup.set_display(current_event.display_name, current_event.description)
	
	$EventHistory.set_events(GameManager.player.event_history)
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


func _on_event_history_button_pressed() -> void:
	$DailyEventPopup.show()
