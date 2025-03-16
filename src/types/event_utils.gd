extends Node
class_name EventUtils


#TODO: Add cards
enum {
	FULL_MOON,
	NEW_MOON,
	JUPITER_ECLIPSES_NEPTUNE,
	BLOOD_MOON_ECLIPSE,
	VENUS_MEETS_MARS,
	SATURN_RETROGRADE,
	MERCURY_IN_STAGNATION,
	VENUS_IN_LEO,
	MARS_COLLIDES_WITH_URANUS,
	NEPTUNE_IN_REVERSE_MOTION,
	JUPITER_IN_CAPRICORN,
	TOTAL_SOLAR_ECLIPSE,
}

static var events: Dictionary[int, Event] = {
	FULL_MOON: Event.new(
		"Full Moon",
		"พระจันทร์เต็มดวง",
		func(player: Player) -> void:
			player.add_love(+20),
	),
	NEW_MOON: Event.new(
		"New Moon",
		"พระจันทร์ดับ",
		func(player: Player) -> void:
			player.add_love(-20),
	),
	JUPITER_ECLIPSES_NEPTUNE: Event.new(
		"Jupiter Eclipses Neptune",
		"ดาวพฤหัสบดีบังดาวเนปจูน – ความหวังถูกบดบัง",
		func(player: Player) -> void:
			player.add_love(-10)
			player.add_study(+15),
	),
	BLOOD_MOON_ECLIPSE: Event.new(
		"Blood Moon Eclipse",
		"จันทรุปราคาสีเลือด – อารมณ์แปรปรวน",
		func(player: Player) -> void:
			player.add_love(-15)
			player.add_health(-10),
	),
	VENUS_MEETS_MARS: Event.new(
		"Venus Meets Mars",
		"ดาวศุกร์ร่วมดาวอังคาร – แรงดึงดูดพุ่งสูง",
		func(player: Player) -> void:
			player.add_love(+20)
			player.add_money(-10),
	),
	SATURN_RETROGRADE: Event.new(
		"Saturn Retrograde",
		"ดาวเสาร์โคจรย้อนกลับ – ความอดทนถูกทดสอบ",
		func(player: Player) -> void:
			player.add_study(+20)
			player.add_health(-10),
	),
	MERCURY_IN_STAGNATION: Event.new(
		"Mercury in Stagnation",
		"ดาวพุธพักองศา – ความสับสนทางความคิด",
		func(player: Player) -> void:
			player.add_study(-15)
			player.add_money(-10),
	),
	VENUS_IN_LEO: Event.new(
		"Venus in Leo",
		"ดาวศุกร์เข้าสู่ราศีสิงห์ – เสน่ห์พุ่งกระฉูด",
		func(player: Player) -> void:
			player.add_love(+25)
			player.add_health(+10),
	),
	MARS_COLLIDES_WITH_URANUS: Event.new(
		"Mars Collides with Uranus",
		"ดาวอังคารชนกับดาวยูเรนัส – เหตุการณ์ไม่คาดฝัน",
		func(player: Player) -> void:
			player.add_study(+5)
			player.add_health(-15)
			player.add_money(+20),
	),
	NEPTUNE_IN_REVERSE_MOTION: Event.new(
		"Neptune in Reverse Motion",
		"ดาวเนปจูนถอยหลัง – ความฝันสับสน",
		func(player: Player) -> void:
			player.add_love(-5)
			player.add_money(+5),
	),
	JUPITER_IN_CAPRICORN: Event.new(
		"Jupiter in Capricorn",
		"ดาวพฤหัสบดีโคจรเข้าสู่ราศีมังกร – วินัยนำไปสู่ความสำเร็จ",
		func(player: Player) -> void:
			player.add_study(+25)
			player.add_health(+5),
	),
	TOTAL_SOLAR_ECLIPSE: Event.new(
		"Total Solar Eclipse",
		"สุริยุปราคาเต็มดวง – จุดเปลี่ยนของชีวิต",
		func(player: Player) -> void:
			player.add_love(+10)
			player.add_health(-10),
	),
}


static func get_event(index: int) -> Event:
	return EventUtils.events[index]
