extends Control
class_name LuckBar

var value: float = 0
const MIN_MAX: float = 2000
const GROWTH_RATE: float = 2.71828
@export var color: Color = Color.WHITE


func _ready() -> void:
	set_color(color)
	update_bar()


func set_value(value: int) -> void:
	self.value = value
	update_bar()


func set_color(color: Color) -> void:
	$PositiveBar.color = color
	$NegativeBar.color = color


#TODO: Add tween?
func update_bar() -> void:
	if value >= 0:
		$PositiveBar.anchor_top = 0.5 - convert_to_height(value)
		$NegativeBar/Label.hide()
		$PositiveBar/Label.text = str(value)
		$PositiveBar/Label.show()
	else:
		$NegativeBar.anchor_bottom = 0.5 - convert_to_height(value)
		$PositiveBar/Label.hide()
		$PositiveBar/Label.text = str(value)
		$NegativeBar/Label.show()


func convert_to_height(num: float) -> float:
	var clamped_num = abs(min(MIN_MAX, num))
	return 1 - exp(-GROWTH_RATE * num)
