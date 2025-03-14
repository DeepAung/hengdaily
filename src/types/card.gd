class_name Card
extends Node

var display_name: String
var description: String
var inner_texture: Texture2D
var frame_texture: Texture2D
var icon_texture_list: Array[Texture2D]
var _apply_func: Callable # func(player: Player) -> void


func _init(display_name: String, description: String, inner_texture: int, frame_texture: int, icon_list: Array[int], apply_func: Callable) -> void:
	self.display_name = display_name
	self.description = description
	self.inner_texture = SpriteUtils.get_inner(inner_texture)
	self.frame_texture = SpriteUtils.get_frame(frame_texture)
	
	for icon in icon_list:
		self.icon_texture_list.append(SpriteUtils.get_icon(icon))
	
	self._apply_func = apply_func


func apply(player: Player) -> void:
	self._apply_func.call(player)
