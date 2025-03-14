class_name Player
extends Node

var id: int
var display_name: String
var age: int
var gpa: int
var birthday_unix: int
var luck_love: int
var luck_study: int
var luck_health: int
var luck_money: int
var current_cards: Array[Card]
var completed_cards: Array[bool]
var event_history: Array[Event]
var last_login_unix: int

func _init(id: int, display_name: String, age: int, gpa: int, birthday_unix: int) -> void:
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
