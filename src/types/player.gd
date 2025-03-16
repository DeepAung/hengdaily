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
	self.luck_love = 0
	self.luck_study = 0
	self.luck_health = 0
	self.luck_money = 0
	
	self.current_cards = []
	self.event_history = []
	self.last_login_unix = -1


static func player_to_dictionary(player: Player) -> Dictionary:
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
		current_cards = player.current_cards,
		completed_cards = player.completed_cards,
		event_history = player.event_history,
		last_login_unix = player.last_login_unix,
	}

# TODO: parse array
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
	#player.current_cards = Array(document.current_cards.arrayValue.values)
	#player.completed_cards = Array(document.completed_cards.arrayValue.values)
	#player.event_history = Array(document.event_history.arrayValue.values)
	player.last_login_unix = int(document.last_login_unix.integerValue)
	
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

func add_money_percent(amount: int, percent: int):
	if randf() * 100 < percent:
		self.luck_money += amount

func add_study_percent(amount: int, percent: int):
	if randf() * 100 < percent:
		self.luck_study += amount

func add_health_percent(amount: int, percent: int):
	if randf() * 100 < percent:
		self.luck_health += amount
