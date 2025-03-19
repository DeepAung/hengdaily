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
	FallenAngel,
	MakeAFriend,
	Strangers,
	TakeSomeRisks,
	BeKind,
	StayHydrated,
	JoggingI,
	JoggingII,
	TakeSomeRest,
	JustRelax
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
	#Inner.TEST: preload("res://assets/icon.svg"),
	Inner.MOODENG: preload("res://assets/inner/MooDeng.png"),
	Inner.DIVINEZENITH: preload("res://assets/inner/DivineZenith.png"),
	Inner.LuckyChicken: preload("res://assets/inner/LuckyChicken.png"),
	Inner.DoubleSidedLuck: preload("res://assets/inner/DoubleSidedLuck.png"),
	Inner.Meditation: preload("res://assets/inner/Meditation.png"),
	Inner.BuddhaBeliever: preload("res://assets/inner/BuddhaBeliever.png"),
	Inner.TheFool: preload("res://assets/inner/TheFool.png"),
	Inner.MakeAMerit: preload("res://assets/inner/MakeAFriend.png"),
	Inner.TheEarlyBird: preload("res://assets/inner/TheEarlyBird.png"),
	Inner.FullMoonNight: preload("res://assets/inner/FullMoonNight.png"),
	Inner.StudyI: preload("res://assets/inner/StudyI.png"),
	Inner.StudyII: preload("res://assets/inner/StudyII.png"),
	Inner.StudyIII: preload("res://assets/inner/StudyIII.png"),
	Inner.KingsAsc: preload("res://assets/inner/KingAsc.png"),
	Inner.HealthyDiet: preload("res://assets/inner/HealthyDiet.png"),
	Inner.HealthyBodyHealthyMind: preload("res://assets/inner/HealthyBodyHealthyMind.png"),
	Inner.DevilsCurse: preload("res://assets/inner/DevilCurse.png"),
	Inner.DevilsWhisper: preload("res://assets/inner/DevilWhisper.png"),
	Inner.BackToBasic: preload("res://assets/inner/BackToBasic.png"),
	Inner.MajorArcana: preload("res://assets/inner/MajorArcana.png"),
	Inner.FallenAngel: preload("res://assets/inner/FallenAngel.png"),
	Inner.MakeAFriend: preload("res://assets/inner/MakeAFriend.png"),
	Inner.Strangers: preload("res://assets/inner/Strangers.png"),
	Inner.TakeSomeRisks: preload("res://assets/inner/TakeSomeRisks.png"),
	Inner.BeKind: preload("res://assets/inner/BeKind.png"),
	Inner.StayHydrated: preload("res://assets/inner/StayHydrated.png"),
	Inner.JoggingI: preload("res://assets/inner/JoggingI.png"),
	Inner.JoggingII: preload("res://assets/inner/JoggingII.png"),
	Inner.TakeSomeRest: preload("res://assets/inner/TakeSomeRest.png"),
	Inner.JustRelax: preload("res://assets/inner/JustRelax.png"),
}


static func get_icon(icon: int) -> Texture2D:
	return icon_textures[icon]


static func get_frame(frame: int) -> Texture2D:
	return frame_textures[frame]
	

static func get_inner(inner: int) -> Texture2D:
	return inner_textures[inner]
