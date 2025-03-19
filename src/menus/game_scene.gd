extends Node

const CardButton = preload("res://src/components/card_button.tscn")

signal _init_finished
const cards_count = 3
var current_clicked_index = -1

func _init() -> void:
	var player_id = GameManager.get_player_id()
	var doc: FirestoreDocument = await Firebase.Firestore.collection("players").get_doc(player_id)
	var player = Player.document_to_player(doc)
	GameManager.setup(player)
	
	SignalBus.card_button_clicked.connect(on_card_button_clicked)
	SignalBus.card_button_hover.connect(on_card_button_hover)
	$CardClickPopup.hide()
	$CardHoverPopup.hide()
	$Cards.hide()
	$DailyEventPopup.hide()
	
	var last_login = Time.get_datetime_dict_from_unix_time(GameManager.player.last_login_unix)
	var today =  Time.get_datetime_dict_from_system()
	var is_new_day: bool = GameManager.greater_date(today, last_login)
	#is_new_day = true;
	
	if (is_new_day):
		# update last_login, event_history, current_cards in FireStore
		await handle_new_day(today)
#		TODO: Focus to DailyEventPopup and once it's closed, randomize 3 new cards to the player's current_cards, 
#		      then play the draw card animation using play_draw_animation. And then once all the card moving is 
#		      done, spawn a Control node with all the cards face-down. On the node (probably needs to be a 
#		      separate scene or using the existing CardButton scene), have the click event trigger play the card
#		      flip animation (flip to the corresponding card texture(s) that was randomized after the DailyEventPopup

	var event = GameManager.player.get_latest_event()
	$DailyEventPopup.set_display(event.display_name, event.description)
	$DailyEventPopup.visible = is_new_day
	
	$EventHistory.set_events(GameManager.player.event_history)
	
	$LuckChart.set_luck_values(GameManager.player.luck_love, GameManager.player.luck_money, GameManager.player.luck_health, GameManager.player.luck_study)
	set_cards(GameManager.player)


func handle_new_day(today: Dictionary) -> void:
	# update player's field
	GameManager.player.last_login_unix = Time.get_unix_time_from_datetime_dict(today)
	
	var current_event = GameManager.deck.pick_event()
	GameManager.player.event_history.append(current_event)
	current_event.apply(GameManager.player)
	#$LuckChart.set_luck_values(GameManager.player.luck_love, GameManager.player.luck_money, GameManager.player.luck_health, GameManager.player.luck_study)
	
	var current_cards = GameManager.deck.pick_cards(cards_count)
	GameManager.player.current_cards = current_cards
	GameManager.player.completed_cards = []
	for i in cards_count:
		GameManager.player.completed_cards.append(false)
	
	# update player object in Firestore
	var update_doc = FirestoreDocument.new()
	var player_dict = Player.player_to_dictionary(GameManager.player)
	update_doc.doc_name = player_dict.id
	update_doc.add_or_update_field("last_login_unix", player_dict.last_login_unix)
	update_doc.add_or_update_field("event_index_history", player_dict.event_index_history)
	update_doc.add_or_update_field("current_cards_index", player_dict.current_cards_index)
	update_doc.add_or_update_field("completed_cards", player_dict.completed_cards)
	update_doc.add_or_update_field("luck_love", player_dict.luck_love)
	update_doc.add_or_update_field("luck_study", player_dict.luck_study)
	update_doc.add_or_update_field("luck_health", player_dict.luck_health)
	update_doc.add_or_update_field("luck_money", player_dict.luck_money)
	await Firebase.Firestore.collection("players").update(update_doc)


func set_cards(player: Player) -> void:
	for i in range(player.current_cards.size()):
		var card_button: CardButton = $Cards/VBoxContainer.get_child(i)
		card_button.setup(player.current_cards[i], player.completed_cards[i])
	$Cards.show()
	

#TODO: Create an instance of a Node2D with proper textures of the cards (face down) and 
#      move it from the card deck to the location on the screen
func play_draw_animation(location: Vector2) -> void:
	pass


func on_card_button_clicked(index: int) -> void:
	current_clicked_index = index
	$CardClickPopup.show()
	var card = GameManager.player.current_cards[index]
	$CardClickPopup/CenterContainer/VBoxContainer/Label.text = "Did you complete this Quest? (" + card.display_name + ")"
	$CardClickPopup/CenterContainer/VBoxContainer/Description.text = card.description

func on_card_button_hover(hover: bool, display_name: String, description: String) -> void:
	$CardHoverPopup.visible = hover
	$CardHoverPopup/VBoxContainer/Label.text = display_name
	$CardHoverPopup/VBoxContainer/Description.text = description


func _on_close_popup_pressed() -> void:
	$CardClickPopup.hide()


func _on_confirm_button_pressed() -> void:
	$CardClickPopup/CenterContainer/VBoxContainer/HBoxContainer/Confirm.disabled = true
	await handle_complete_card(current_clicked_index)
	
	var clicked_card: CardButton = $Cards/VBoxContainer.get_child(current_clicked_index)
	clicked_card.completed = true
	
	$CardClickPopup.hide()
	$CardClickPopup/CenterContainer/VBoxContainer/HBoxContainer/Confirm.disabled = false



func handle_complete_card(index: int) -> void:
	GameManager.player.current_cards[index].apply(GameManager.player)
	$LuckChart.set_luck_values(GameManager.player.luck_love, GameManager.player.luck_money, GameManager.player.luck_health, GameManager.player.luck_study)
	GameManager.player.completed_cards[index] = true
	
	var update_doc = FirestoreDocument.new()
	var player_dict = Player.player_to_dictionary(GameManager.player)
	update_doc.doc_name = player_dict.id
	update_doc.add_or_update_field("completed_cards", player_dict.completed_cards)
	update_doc.add_or_update_field("luck_love", player_dict.luck_love)
	update_doc.add_or_update_field("luck_study", player_dict.luck_study)
	update_doc.add_or_update_field("luck_health", player_dict.luck_health)
	update_doc.add_or_update_field("luck_money", player_dict.luck_money)
	await Firebase.Firestore.collection("players").update(update_doc)
