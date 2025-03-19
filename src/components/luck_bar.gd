extends Control
class_name LuckBar

var value: float = 0
const MIN_MAX: float = 2000
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


#TODO: Add tween?
func update_bar() -> void:
	if value >= 0:
		$NegativeBar.anchor_bottom = 0.5
		$NegativeBar.anchor_top = 0.5
		$PositiveBar.anchor_bottom = 0.5
		$PositiveBar.anchor_top = 0.5 - convert_to_height(value)
		$NegativeBar/Label.hide()
		$PositiveBar/Label.text = str(value)
		$PositiveBar/Label.show()
	else:
		$PositiveBar.anchor_top = 0.5
		$PositiveBar.anchor_bottom = 0.5
		$NegativeBar.anchor_top = 0.5
		$NegativeBar.anchor_bottom = 0.5 + convert_to_height(value)
		$PositiveBar/Label.hide()
		$NegativeBar/Label.text = str(value)
		$NegativeBar/Label.show()


func convert_to_height(num: float) -> float:
	var clamped_num = min(MIN_MAX, abs(num))
	return 1 - exp(-1/MIN_MAX * clamped_num)
	
