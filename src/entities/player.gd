class_name Player
extends Node

var id: int
var display_name: String
var age: int
var gpa: int
var birthday: Time
var luck_love: int
var luck_study: int
var luck_health: int
var luck_money: int

func _init(id: int, display_name: String, age: int, gpa: int, birthday: Time) -> void:
	self.id = id
	self.display_name = display_name
	self.age = age
	self.gpa = gpa
	self.birthday = birthday
	
	# TODO: use input from above to calculate luck below (from -100 to +100)
	self.luck_love = 0
	self.luck_study = 0
	self.luck_health = 0
	self.luck_money = 0
