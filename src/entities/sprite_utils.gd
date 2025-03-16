extends Node
class_name SpriteUtils

enum Icon {
	LOVE,
	STUDY,
	HEALTH,
	MONEY,
	BAD_LOVE,
	BAD_STUDY,
	BAD_HEALTH,
	BAD_MONEY,
	QUESTIONMARK
}

enum Frame {
	LOVE,
	MONEY,
	HEALTH,
	STUDY,
	SPECIAL,
	NORMAL
} 

# TODO: add appropriate textures
enum Inner {
	TEST,
	MOODENG,
	DIVINEZENITH,
	LuckyChicken,
	DoubleSidedLuck,
	Meditation,
	BuddhaBeliever,
	TheFool,
	MakeAMerit,
	TheEarlyBird,
	FullMoonNight,
	StudyI,
	StudyII,
	StudyIII,
	KingsAsc,
	HealthyDiet,
	HealthyBodyHealthyMind,
	DevilsCurse,
	DevilsWhisper,
	BackToBasic,
	MajorArcana,
	FallenAngel
	
}

const icon_textures = {
	Icon.LOVE: preload("res://assets/icon/love.png"),
	Icon.STUDY: preload("res://assets/icon/study.png"),
	Icon.HEALTH: preload("res://assets/icon/health.png"),
	Icon.MONEY: preload("res://assets/icon/money.png"),
	Icon.BAD_LOVE: preload("res://assets/icon/bad_love.png"),
	Icon.BAD_STUDY: preload("res://assets/icon/bad_study.png"),
	Icon.BAD_HEALTH: preload("res://assets/icon/bad_health.png"),
	Icon.BAD_MONEY: preload("res://assets/icon/bad_money.png"),
	Icon.QUESTIONMARK: preload("res://assets/icon/questionmark.png")
}

const frame_textures = {
	Frame.LOVE: preload("res://assets/frame/pink.png"),
	Frame.MONEY: preload("res://assets/frame/yellow.png"),
	Frame.HEALTH: preload("res://assets/frame/green.png"),
	Frame.STUDY: preload("res://assets/frame/blue.png"),
	Frame.SPECIAL: preload("res://assets/frame/special.png"),
	Frame.NORMAL: preload("res://assets/frame/normal.png")
}

# TODO: add appropriate textures
const inner_textures = {
	Inner.TEST: preload("res://assets/icon.svg"),
	Inner.MOODENG: preload("res://assets/inner/MooDeng.png"),
	Inner.DIVINEZENITH: preload("res://assets/inner/DivineZenith.png"),
	Inner.LuckyChicken: preload("res://assets/inner/LuckyChicken.png"),
		
}


static func get_icon(icon: int) -> Texture2D:
	return icon_textures[icon]


static func get_frame(frame: int) -> Texture2D:
	return frame_textures[frame]
	

static func get_inner(inner: int) -> Texture2D:
	return inner_textures[inner]
