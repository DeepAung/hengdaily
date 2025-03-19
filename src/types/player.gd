class_name Player
extends Node

var id: String
var display_name: String
var age: int
var gpa: float
var birthday_unix: int
var luck_love: int
var luck_study: int
var luck_health: int
var luck_money: int
var current_cards: Array[Card]
var completed_cards: Array[bool]
var event_history: Array[Event]
var last_login_unix: int

func _init(id: String, display_name: String, age: int, gpa: float, birthday_unix: int) -> void:
	self.id = id
	self.display_name = display_name
	self.age = age
	self.gpa = gpa
	self.birthday_unix = birthday_unix
	
	# TODO: use input from above to calculate luck below (from -100 to +100)
	self.luck_love = self.calculate(2, 23)
	self.luck_study = self.calculate(4, 37)
	self.luck_health = self.calculate(1, 99)
	self.luck_money = self.calculate(3, 555)
	
	
	self.current_cards = []
	self.event_history = []
	self.last_login_unix = -1


func calculate(x: int, y: int) -> int:
	var seed = 0;
	for i in range(len(self.display_name)):
		seed += self.display_name.unicode_at(i)
	seed += self.age * x - y
	seed /= self.gpa + 1.0
	seed = int(seed)
	seed += abs(self.birthday_unix) % 269
	var result = rand_from_seed(seed)[0] % 200 - 100
	return result


static func player_to_dictionary(player: Player) -> Dictionary:
	var current_cards_index: Array[int] = []
	for card in player.current_cards:
		var index = GameManager.deck.cards.find(card)
		current_cards_index.append(index)
	
	var event_index_history: Array[int] = []
	for event in player.event_history:
		var index = GameManager.deck.events.find(event)
		event_index_history.append(index)
	
	return {
		id = player.id,
		display_name = player.display_name,
		age = player.age,
		gpa = player.gpa,
		birthday_unix = player.birthday_unix,
		luck_love = player.luck_love,
		luck_study = player.luck_study,
		luck_health = player.luck_health,
		luck_money = player.luck_money,
		current_cards_index = current_cards_index,
		completed_cards = player.completed_cards,
		event_index_history = event_index_history,
		last_login_unix = player.last_login_unix,
	}


static func document_to_player(doc: FirestoreDocument) -> Player:
	var document = doc.document
	var player: Player = Player.new("", "", 0, 0, 0) # TODO: is there a better way?
	player.id = str(document.id.stringValue)
	player.display_name = str(document.display_name.stringValue)
	player.age = int(document.age.integerValue)
	player.gpa = float(document.gpa.doubleValue)
	player.birthday_unix = int(document.birthday_unix.integerValue)
	player.luck_love = int(document.luck_love.integerValue)
	player.luck_study = int(document.luck_study.integerValue)
	player.luck_health = int(document.luck_health.integerValue)
	player.luck_money = int(document.luck_money.integerValue)
	player.last_login_unix = int(document.last_login_unix.integerValue)
	
	var iter = []
	if document.current_cards_index.arrayValue.has("values"):
		iter = document.current_cards_index.arrayValue.values
	for obj in iter:
		var index = int(obj.integerValue)
		player.current_cards.append(GameManager.deck.cards[index])
	
	iter = []
	if document.completed_cards.arrayValue.has("values"):
		iter = document.completed_cards.arrayValue.values
	for obj in iter:
		var boolean = bool(obj.booleanValue)
		player.completed_cards.append(boolean)
	
	iter = []
	if document.event_index_history.arrayValue.has("values"):
		iter = document.event_index_history.arrayValue.values
	for obj in iter:
		var index = int(obj.integerValue)
		player.event_history.append(GameManager.deck.events[index])
	
	return player


func get_latest_event() -> Event:
	if len(self.event_history) == 0:
		return null
	return self.event_history[len(self.event_history) - 1]


#Utility functions for adding and substracting luck from players
func add_love(amount: int):
	self.luck_love += amount
	
func add_money(amount: int):
	self.luck_money += amount

func add_study(amount: int):
	self.luck_study += amount

func add_health(amount: int):
	self.luck_health += amount

func add_love_percent(amount: int, percent: int):
	if randf() * 100 < percent:
		self.luck_love += amount
		return true
	return false

func add_money_percent(amount: int, percent: int):
	if randf() * 100 < percent:
		self.luck_money += amount
		return true
	return false
	
func add_study_percent(amount: int, percent: int):
	if randf() * 100 < percent:
		self.luck_study += amount
		return true
	return false
	
func add_health_percent(amount: int, percent: int):
	if randf() * 100 < percent:
		self.luck_health += amount
		return true
	return false
