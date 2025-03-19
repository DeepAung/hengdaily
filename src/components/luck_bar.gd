extends Control
class_name LuckBar

var value: int = 0
@export var label: String = ""
const GROWTH_RATE: float = 0.003
@export var color: Color = Color.WHITE

func _ready() -> void:
	$PositiveBar.anchor_bottom = 0.5
	$PositiveBar.anchor_top = 0.5
	$PositiveBar.anchor_left = 0.0
	$PositiveBar.anchor_right = 1.0
	
	$NegativeBar.anchor_bottom = 0.5
	$NegativeBar.anchor_top = 0.5
	$NegativeBar.anchor_left = 0.0
	$NegativeBar.anchor_right = 1.0
	set_color(color)
	update_bar()


func set_value(value: int) -> void:
	self.value = value
	update_bar()


func set_color(color: Color) -> void:
	$PositiveBar.color = color
	$NegativeBar.color = color


func update_bar() -> void:
	if value >= 0:
		$PositiveBar.anchor_top = 0.5 - convert_to_height(value)
		$NegativeBar.anchor_bottom = 0.5
		$PositiveBar/Label.text = str(value)
		$NegativeBar/Label.text = label
	else:
		$NegativeBar.anchor_bottom = 0.5 + convert_to_height(value)
		$PositiveBar.anchor_top = 0.5
		$PositiveBar/Label.text = label
		$NegativeBar/Label.text = str(value)
		
func convert_to_height(num: float) -> float:
	return (1 - exp(-GROWTH_RATE * abs(num)))/2
