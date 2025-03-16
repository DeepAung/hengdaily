extends Node
class_name CardUtils


#TODO: Add cards
enum {
	LuckyChicken,
	MooDeng,
	DivineZenith,
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

#TODO: Add cards
static var cards: Dictionary[int, Card] = {
	LuckyChicken:Card.new(
		"Lucky Chicken",
		"กินเหนียวไก่ที่คณะวิศวะตอนเที่ยง",
		SpriteUtils.Inner.LuckyChicken,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func(player:Player) -> void:
			player.add_study_percent(20,25)
			if not player.add_health_percent(-10,25):
				player.add_health_percent(-10,75),
	),
	MooDeng:Card.new(
		"MOODENG",
		"กินลูกชิ้นหมู 20 บาท",
		SpriteUtils.Inner.MOODENG,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func(player:Player) -> void:
			player.add_study(100)
			player.add_health(-50),
		
	),
	DivineZenith:Card.new(
		"DEVINE ZENITH",
		"ออกกำลังกาย 2 ชั่วโมง อ่านหนังสือ 5 ชั่วโมง นอนครบ 8 ชั่วโมง ภายในวันนี้ ",
		SpriteUtils.Inner.DIVINEZENITH,
		SpriteUtils.Frame.SPECIAL,
		[SpriteUtils.Icon.LOVE,SpriteUtils.Icon.STUDY,SpriteUtils.Icon.HEALTH,SpriteUtils.Icon.MONEY],
		func(player:Player) -> void:
			player.add_love(100)
			player.add_health(100)
			player.add_money(100)
			player.add_study(100),
	),
	DoubleSidedLuck:Card.new(
		"Double Sided Luck",
		"อ่านหนังสือ 2 ชั่วโมง ตอน 02:02",
		SpriteUtils.Inner.DoubleSidedLuck,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func (player:Player) -> void:
			player.add_study(100)
			player.add_health(-100),
	),
	Meditation:Card.new(
		"Meditation",
		"นั่งสมาธิก่อนนอน 10 นาที",
		SpriteUtils.Inner.Meditation,
		SpriteUtils.Frame.NORMAL,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.HEALTH],
		func (player:Player) -> void:
			player.add_health(25)
			player.add_study(25),
	),
	BuddhaBeliever:Card.new(
		"Buddha Believer",
		"สวดมนต์ก่อนนอน",
		SpriteUtils.Inner.BuddhaBeliever,
		SpriteUtils.Frame.SPECIAL,
		[SpriteUtils.Icon.LOVE,SpriteUtils.Icon.STUDY,SpriteUtils.Icon.HEALTH,SpriteUtils.Icon.MONEY],
		func (player:Player) -> void:
			player.add_love(20)
			player.add_health(20)
			player.add_money(20)
			player.add_study(20),
	),
	TheFool:Card.new(
		"The Fool",
		"สามารถทำให้เพื่อนในกลุ่มอย่างน้อย 1 คน หัวเราะกับมุกตลกของคุณ",
		SpriteUtils.Inner.TheFool,
		SpriteUtils.Frame.LOVE,
		[SpriteUtils.Icon.LOVE,SpriteUtils.Icon.MONEY,SpriteUtils.Icon.BAD_STUDY],
		func (player:Player) -> void:
			player.add_love(50)
			player.add_money(25)
			player.add_study_percent(50,50),
		),
	MakeAMerit : Card.new(
		"Make a merit",
		"ทำบุญตักบาตร",
		SpriteUtils.Inner.MakeAMerit,
		SpriteUtils.Frame.SPECIAL,
		[SpriteUtils.Icon.LOVE,SpriteUtils.Icon.HEALTH,SpriteUtils.Icon.MONEY],
		func(player:Player) -> void:
			player.add_love(30)
			player.add_health(30)
			player.add_money(30),
	),
	TheEarlyBird: Card.new(
		"The Early Bird",
		"ตื่น 6 โมงเช้า",
		SpriteUtils.Inner.TheEarlyBird,
		SpriteUtils.Frame.NORMAL,
		
		[SpriteUtils.Icon.MONEY,SpriteUtils.Icon.HEALTH],
		func(player:Player) -> void:
			player.add_money(20)
			player.add_health(20),
	),
	FullMoonNight: Card.new(
		"Full Moon Night",
		"ถ่ายรูปพระจันทร์คืนนี้แล้วส่งให้คนที่คุณรัก",
		SpriteUtils.Inner.FullMoonNight,
		SpriteUtils.Frame.LOVE,
		[SpriteUtils.Icon.LOVE],
		func(player:Player) -> void:
			player.add_love(150),
	),
	StudyI :Card.new(
		"Study I",
		"อ่านหนังสือ 1 ชั่วโมง",
		SpriteUtils.Inner.StudyI,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY],
		func (player:Player) -> void:
			player.add_study(10),
	),
	StudyII :Card.new(
		"Study II",
		"อ่านหนังสือ 2 ชั่วโมง",
		SpriteUtils.Inner.StudyII,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY],
		func (player:Player) -> void:
			player.add_study(20),
	),
	StudyIII :Card.new(
		"Study III",
		"อ่านหนังสือ 3 ชั่วโมง",
		SpriteUtils.Inner.StudyIII,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func (player:Player) -> void:
			player.add_study(30)
			player.add_health(-5),
	),
	KingsAsc: Card.new(
		"King’s Ascension",
		"สามารถพิชิตเป้าหมายที่ต้องการทำให้สำเร็จในปีนี้ได้อย่างน้อย 1 อย่าง",
		SpriteUtils.Inner.KingsAsc,
		SpriteUtils.Frame.SPECIAL,
		[SpriteUtils.Icon.LOVE,SpriteUtils.Icon.STUDY,SpriteUtils.Icon.HEALTH,SpriteUtils.Icon.MONEY],
		func(player:Player) -> void:
			player.add_health(50)
			player.add_love(50)
			player.add_money(50)
			player.add_study(50),
	),
	HealthyDiet: Card.new(
		"Healthy Diet",
		"กินข้าวครบ 3 มื้อ ครบ 5 หมู่ทุกมื้อ",
		SpriteUtils.Inner.HealthyDiet,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH],
		func(player:Player) -> void:
			player.add_health(40),
	),
	HealthyBodyHealthyMind: Card.new(
		"Healthy Body Healthy Mind",
		"ออกกำลังกาย 1 ชั่วโมง นั่งสมาธิ 20 นาที",
		SpriteUtils.Inner.HealthyBodyHealthyMind,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH,SpriteUtils.Icon.STUDY],
		func(player:Player) -> void:
			player.add_health(70)
			player.add_study(30),
	),
	DevilsCurse: Card.new(
		"Devil’s Curse",
		"เมื่อคืนคุณนอนดึกเกินเที่ยงคืน",
		SpriteUtils.Inner.DevilsCurse,
		SpriteUtils.Frame.SPECIAL,
		[SpriteUtils.Icon.MONEY,SpriteUtils.Icon.BAD_STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func(player:Player) -> void:
			player.add_money_percent(200,50)
			player.add_study_percent(-100,50)
			player.add_health_percent(-100,50),
	),
	DevilsWhisper: Card.new(
		"Devil’s Whisper",
		"อ่านหนังสือติดต่อกัน 8 ชั่วโมง",
		SpriteUtils.Inner.DevilsWhisper,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func(player:Player) -> void:
			player.add_study(200)
			player.add_health(-200),
	),
	BackToBasic: Card.new(
		"Back to Basic",
		"อ่านหนังสือ 1 ชั่วโมง ออกกำลังกาย 30 นาที",
		SpriteUtils.Inner.BackToBasic,
		SpriteUtils.Frame.NORMAL,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.HEALTH],
		func(player:Player) -> void:
			player.add_study(10)
			player.add_health(10),
	),
	MajorArcana: Card.new(
		"Major Arcana",
		"เมื่อเช้าคุณกินอาหารเช้าโดยที่ไม่มีข้าวเลย(ถ้าไม่ได้กินข้าวเช้าไม่ถือว่าสำเร็จภารกิจนี้)",
		SpriteUtils.Inner.MajorArcana,
		SpriteUtils.Frame.SPECIAL,
		[SpriteUtils.Icon.QUESTIONMARK],
		func(player:Player) -> void:
			if not player.add_health_percent(50,10):
				player.add_health_percent(-50,10)
			if not player.add_love_percent(50,10):
				player.add_love_percent(-50,10)
			if not player.add_money_percent(50,10):
				player.add_money_percent(-50,10)
			if not player.add_study_percent(50,10):
				player.add_study_percent(-50,10)
				,
				),
	FallenAngel: Card.new(
		"Fallen Angel",
		"คุณได้ขอโทษกับคนที่คุณทำอะไรไม่ดีด้วยใจจริงในเดือนนี้",
		SpriteUtils.Inner.FallenAngel,
		SpriteUtils.Frame.LOVE,
		[SpriteUtils.Icon.LOVE,SpriteUtils.Icon.BAD_LOVE],
		func(player:Player)  -> void:
			if not player.add_love_percent(50,50):
				player.add_love_percent(-50,50),
	)
}


static func get_card(index: int) -> Card:
	return CardUtils.cards[index]
