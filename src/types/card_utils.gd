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

#TODO: Add cards
static var cards: Dictionary[int, Card] = {
	LuckyChicken: Card.new(
		"Lucky Chicken",
		"กินเหนียวไก่ที่คณะวิศวะตอนเที่ยง\n
		โอกาส 25% ที่จะ +10 study luck, โอกาส 20% ที่จะ +10 health luck",
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
		"กินลูกชิ้นหมู 20 บาท\n
		+100 study luck, -50 health luck",
		SpriteUtils.Inner.MOODENG,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func(player:Player) -> void:
			player.add_study(100)
			player.add_health(-50),
		
	),
	DivineZenith:Card.new(
		"DEVINE ZENITH",
		"ออกกำลังกาย 2 ชั่วโมง อ่านหนังสือ 5 ชั่วโมง นอนครบ 8 ชั่วโมง ภายในวันนี้\n
		+100 ทุก luck",
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
		"อ่านหนังสือ 2 ชั่วโมง ตอน 02:02\n
		+100 study luck, -100 health luck",
		SpriteUtils.Inner.DoubleSidedLuck,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func (player:Player) -> void:
			player.add_study(100)
			player.add_health(-100),
	),
	Meditation:Card.new(
		"Meditation",
		"นั่งสมาธิก่อนนอน 10 นาที\n
		+25 health luck, +25 study luck",
		SpriteUtils.Inner.Meditation,
		SpriteUtils.Frame.NORMAL,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.HEALTH],
		func (player:Player) -> void:
			player.add_health(25)
			player.add_study(25),
	),
	BuddhaBeliever:Card.new(
		"Buddha Believer",
		"สวดมนต์ก่อนนอน\n
		+20 ทุก luck",
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
		"สามารถทำให้เพื่อนในกลุ่มอย่างน้อย 1 คน หัวเราะกับมุกตลกของคุณ\n
		+50 love luck, +25 money luck, โอกาส 50% ที่จะ +50 study luck",
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
		"ทำบุญตักบาตร\n
		+30 love, health, money luck",
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
		"ตื่น 6 โมงเช้า\n
		+20 money, health luck",
		SpriteUtils.Inner.TheEarlyBird,
		SpriteUtils.Frame.NORMAL,
		
		[SpriteUtils.Icon.MONEY,SpriteUtils.Icon.HEALTH],
		func(player:Player) -> void:
			player.add_money(20)
			player.add_health(20),
	),
	FullMoonNight: Card.new(
		"Full Moon Night",
		"ถ่ายรูปพระจันทร์คืนนี้แล้วส่งให้คนที่คุณรัก\n
		+150 love luck",
		SpriteUtils.Inner.FullMoonNight,
		SpriteUtils.Frame.LOVE,
		[SpriteUtils.Icon.LOVE],
		func(player:Player) -> void:
			player.add_love(150),
	),
	StudyI :Card.new(
		"Study I",
		"อ่านหนังสือ 1 ชั่วโมง\n
		+10 study luck",
		SpriteUtils.Inner.StudyI,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY],
		func (player:Player) -> void:
			player.add_study(10),
	),
	StudyII :Card.new(
		"Study II",
		"อ่านหนังสือ 2 ชั่วโมง\n
		+20 study luck",
		SpriteUtils.Inner.StudyII,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY],
		func (player:Player) -> void:
			player.add_study(20),
	),
	StudyIII :Card.new(
		"Study III",
		"อ่านหนังสือ 3 ชั่วโมง\n
		+20 study luck, -5 health luck",
		SpriteUtils.Inner.StudyIII,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func (player:Player) -> void:
			player.add_study(30)
			player.add_health(-5),
	),
	KingsAsc: Card.new(
		"King’s Ascension",
		"สามารถพิชิตเป้าหมายที่ต้องการทำให้สำเร็จในปีนี้ได้อย่างน้อย 1 อย่าง\n
		+50 ทุก luck",
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
		"กินข้าวครบ 3 มื้อ ครบ 5 หมู่ทุกมื้อ\n
		+40 health luck",
		SpriteUtils.Inner.HealthyDiet,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH],
		func(player:Player) -> void:
			player.add_health(40),
	),
	HealthyBodyHealthyMind: Card.new(
		"Healthy Body Healthy Mind",
		"ออกกำลังกาย 1 ชั่วโมง นั่งสมาธิ 20 นาที\n
		+70 health luck, +30 study luck",
		SpriteUtils.Inner.HealthyBodyHealthyMind,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH,SpriteUtils.Icon.STUDY],
		func(player:Player) -> void:
			player.add_health(70)
			player.add_study(30),
	),
	DevilsCurse: Card.new(
		"Devil’s Curse",
		"เมื่อคืนคุณนอนดึกเกินเที่ยงคืน\n
		โอกาส 50% ที่จะ +200 money luck, โอกาส 50% ที่จะ -100 study luck, โอกาส 50% ที่จะ -100 health luck",
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
		"อ่านหนังสือติดต่อกัน 8 ชั่วโมง\n
		+200 study luck, -200 health luck",
		SpriteUtils.Inner.DevilsWhisper,
		SpriteUtils.Frame.STUDY,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.BAD_HEALTH],
		func(player:Player) -> void:
			player.add_study(200)
			player.add_health(-200),
	),
	BackToBasic: Card.new(
		"Back to Basic",
		"อ่านหนังสือ 1 ชั่วโมง ออกกำลังกาย 30 นาที\n
		+10 study luck, +10 health luck",
		SpriteUtils.Inner.BackToBasic,
		SpriteUtils.Frame.NORMAL,
		[SpriteUtils.Icon.STUDY,SpriteUtils.Icon.HEALTH],
		func(player:Player) -> void:
			player.add_study(10)
			player.add_health(10),
	),
	MajorArcana: Card.new(
		"Major Arcana",
		"เมื่อเช้าคุณกินอาหารเช้าโดยที่ไม่มีข้าวเลย(ถ้าไม่ได้กินข้าวเช้าไม่ถือว่าสำเร็จภารกิจนี้)\n
		แต่ละ luck มีโอกาส 10% ที่จะ +50 และ 9% ที่จะ -50",
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
				player.add_study_percent(-50,10),
	),
	FallenAngel: Card.new(
		"Fallen Angel",
		"คุณได้ขอโทษกับคนที่คุณทำอะไรไม่ดีด้วยใจจริงในเดือนนี้\n
		มีโอกาส 50% ที่จะ +50 love luck และ 25% ที่จะ -50 love luck",
		SpriteUtils.Inner.FallenAngel,
		SpriteUtils.Frame.LOVE,
		[SpriteUtils.Icon.LOVE, SpriteUtils.Icon.BAD_LOVE],
		func(player:Player)  -> void:
			if not player.add_love_percent(50,50):
				player.add_love_percent(-50,50),
	),
	MakeAFriend: Card.new(
		"Make a Friend",
		"หาเพื่อนใหม่ 1 คนในวันนี้\n
		+10 money luck, +5 study luck, +5 love luck",
		SpriteUtils.Inner.MakeAFriend,
		SpriteUtils.Frame.MONEY,
		[SpriteUtils.Icon.MONEY, SpriteUtils.Icon.STUDY, SpriteUtils.Icon.LOVE],
		func(player:Player)  -> void:
			player.add_money(10)
			player.add_study(5)
			player.add_love(5),
	),
	Strangers: Card.new(
		"Strangers",
		"ชวนคนแปลกหน้าคุย 2 คนในวันนี้\n
		+5 love luck, +15 money luck",
		SpriteUtils.Inner.Strangers,
		SpriteUtils.Frame.MONEY,
		[SpriteUtils.Icon.LOVE, SpriteUtils.Icon.MONEY],
		func(player: Player) -> void:
			player.add_love(5)
			player.add_money(15),
	),
	TakeSomeRisks: Card.new(
		"Take some risks",
		"ลงทุนคริบโต\n
		มีโอกาส 50/50 ที่จะ +50 money luck หรือ -50 money luck",
		SpriteUtils.Inner.TakeSomeRisks,
		SpriteUtils.Frame.MONEY,
		[SpriteUtils.Icon.MONEY],
		func(player: Player) -> void:
			if not player.add_money_percent(50, 50):
				player.add_money(-50),
	),
	BeKind: Card.new(
		"Be Kind",
		"ช่วยเหลือผู้อื่น 1 ครั้ง\n
		+15 love luck, +10 money luck",
		SpriteUtils.Inner.BeKind,
		SpriteUtils.Frame.LOVE,
		[SpriteUtils.Icon.LOVE, SpriteUtils.Icon.MONEY],
		func(player: Player) -> void:
			player.add_love(15)
			player.add_money(10),
	),
	StayHydrated: Card.new(
		"Stay Hydrated",
		"ดื่มน้ำครบ 8 แก้ว\n
		+5 health luck, +5 study luck",
		SpriteUtils.Inner.StayHydrated,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH, SpriteUtils.Icon.STUDY],
		func(player: Player) -> void:
			player.add_health(5)
			player.add_study(5),
	),
	JoggingI: Card.new(
		"Jogging I",
		"วิ่งยามเช้าเป็นเวลา 15 นาที\n
		+15 health luck",
		SpriteUtils.Inner.JoggingI,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH],
		func(player: Player) -> void:
			player.add_health(15),
	),
	JoggingII: Card.new(
		"Jogging II",
		"วิ่งยามเช้าเป็นเวลา 30 นาที\n
		+25 health luck",
		SpriteUtils.Inner.JoggingII,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH],
		func(player: Player) -> void:
			player.add_health(25),
	),
	TakeSomeRest: Card.new(
		"Take Some Rest",
		"นอนครบ 8 ชั่วโมง\n
		+20 health luck",
		SpriteUtils.Inner.TakeSomeRest,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH, SpriteUtils.Icon.STUDY],
		func(player: Player) -> void:
			player.add_health(20),
	),
	JustRelax: Card.new(
		"Just Relax",
		"ผ่อนคลาย อย่าเครียด ทำในสิ่งที่คุณชื่นชอบ\n
		+5 ทุก luck",
		SpriteUtils.Inner.JustRelax,
		SpriteUtils.Frame.HEALTH,
		[SpriteUtils.Icon.HEALTH, SpriteUtils.Icon.STUDY, SpriteUtils.Icon.LOVE, SpriteUtils.Icon.MONEY],
		func(player: Player) -> void:
			player.add_health(5)
			player.add_study(5)
			player.add_love(5)
			player.add_money(5),
	),
}


static func get_card(index: int) -> Card:
	return CardUtils.cards[index]
