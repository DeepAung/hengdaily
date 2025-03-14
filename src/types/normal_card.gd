class_name NormalCard
extends Card

var add_luck_love: int
var add_luck_study: int
var add_luck_health: int
var add_luck_money: int

func _init(
	display_name: String, 
	description: String, 
	inner_texture: int, 
	frame_texture: int, 
	icon_list: Array[int], 
	add_luck_love: int, 
	add_luck_study: int, 
	add_luck_health: int, 
	add_luck_money: int) -> void:

	super(display_name, description, inner_texture, frame_texture, icon_list, Callable.create(null, "null"))
	self.add_luck_love = add_luck_love
	self.add_luck_study = add_luck_study
	self.add_luck_health = add_luck_health
	self.add_luck_money = add_luck_money

func apply(player: Player) -> void:
	player.luck_love += add_luck_love
	player.luck_study += add_luck_study
	player.luck_health += add_luck_health
	player.luck_money += add_luck_money
