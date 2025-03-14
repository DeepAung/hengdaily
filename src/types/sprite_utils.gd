class_name SpriteUtils
extends Node

enum Icon {
	LOVE,
	STUDY,
	HEALTH,
	MONEY,
	BAD_LOVE,
	BAD_STUDY,
	BAD_HEALTH,
	BAD_MONEY
}

enum Frame {
	PINK,
	YELLOW,
	GREEN,
	BLUE
} 

# TODO: add appropriate textures
enum Inner {
	TEST
}

const icon_textures = {
	Icon.LOVE: preload("res://assets/icon/love.png"),
	Icon.STUDY: preload("res://assets/icon/study.png"),
	Icon.HEALTH: preload("res://assets/icon/health.png"),
	Icon.MONEY: preload("res://assets/icon/money.png"),
	Icon.BAD_LOVE: preload("res://assets/icon/bad_love.png"),
	Icon.BAD_STUDY: preload("res://assets/icon/bad_study.png"),
	Icon.BAD_HEALTH: preload("res://assets/icon/bad_health.png"),
	Icon.BAD_MONEY: preload("res://assets/icon/bad_money.png")
}

const frame_textures = {
	Frame.PINK: preload("res://assets/frame/pink.png"),
	Frame.YELLOW: preload("res://assets/frame/yellow.png"),
	Frame.GREEN: preload("res://assets/frame/green.png"),
	Frame.BLUE: preload("res://assets/frame/blue.png")
}

# TODO: add appropriate textures
const inner_textures = {
	Inner.TEST: preload("res://assets/icon.svg")
}


static func get_icon(icon: int) -> Texture2D:
	return icon_textures[icon]


static func get_frame(frame: int) -> Texture2D:
	return frame_textures[frame]
	

static func get_inner(inner: int) -> Texture2D:
	return inner_textures[inner]
