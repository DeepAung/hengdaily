class_name Event
extends Node

var display_name: String
var description: String
var _apply_func: Callable # func(player: Player) -> void

func _init(display_name: String, description: String, apply_func: Callable) -> void:
	self.display_name = display_name
	self.description = description
	self._apply_func = apply_func

func apply(player: Player) -> void:
	self._apply_func.call(player)
