extends PanelContainer
class_name LuckChart

var luck_love: int
var luck_money: int
var luck_health: int
var luck_study: int


func _ready() -> void:
	pass


func update_bars() -> void:
	%LoveBar.set_value(luck_love)
	%MoneyBar.set_value(luck_money)
	%HealthBar.set_value(luck_health)
	%StudyBar.set_value(luck_study)


func set_luck_values(luck_love: int, luck_money: int, luck_health: int, luck_study: int):
	self.luck_love = luck_love
	self.luck_money = luck_money
	self.luck_health = luck_health
	self.luck_study = luck_study
	update_bars()
