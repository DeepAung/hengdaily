extends Control

var current_index = 0
const questions = [
	"Enter Your Name",
	"Enter Your Age",
	"Enter Your Gpa",
	"Enter Your Birthday (A.D.)",
]

var answers = [
	"",
	"",
	"",
	""
]

var answers_placeholder = [
	"Enter your name",
	0,
	0.0,
	0
]

func _ready() -> void:
	if not GameManager.has_player_id():
		$Status.text = "error: user is not signed in. redirecting to signin_menu"
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://src/menus/signin_menu.tscn")
	
	render()

func _on_next_pressed() -> void:
	var ok: bool = set_answer()
	if not ok:
		return
	$Status.text = ""
	
	current_index += 1
	if current_index >= len(questions):
		create_player()
		get_tree().change_scene_to_file("res://src/menus/game_scene.tscn")
	else:
		render()

func _on_previous_pressed() -> void:
	$Status.text = ""
	current_index -= 1
	if current_index < 0:
		current_index = 0
	render()

func render() -> void:
	$Question.text = questions[current_index]
	%Answer.text = str(answers[current_index])
	%Answer.placeholder_text = str(answers_placeholder[current_index])
	
	if current_index == len(questions) - 1:
		%Next.text = "Confirm"
	else:
		%Next.text = "Next"
	
	if current_index == 3:
		%DateInputContainer.visible = true
		%Answer.visible = false
	else:
		%DateInputContainer.visible = false
		%Answer.visible = true
	
	if current_index == 0:
		%Previous.visible = false
	else:
		%Previous.visible = true

func set_answer() -> bool:
	var text: String = %Answer.text
	match current_index:
		0:
			if text == "":
				$Status.text = "error: Name must not be empty"
				return false
			answers[current_index] = text
		1:
			if not text.is_valid_int():
				$Status.text = "error: Age must be integer"
				return false
			var value: int = int(text)
			if value <= 0:
				$Status.text = "error: Age must be positive number"
				return false
			if value > 100:
				$Status.text = "error: I know you are lying about your age"
				return false
			answers[current_index] = value
		2:
			if not text.is_valid_float():
				$Status.text = "error: GPA must be floating number"
				return false
			var value: float = float(text)
			if value < 0:
				$Status.text = "error: GPA must be positive number"
				return false
			if value > 4:
				$Status.text = "error: GPA must not be greater than 4.00"
				return false
			answers[current_index] = float(%Answer.text)
		3:
			if not %DateInputContainer/Year.text.is_valid_int():
				$Status.text = "error: BirthDay year must be integer"
				return false
			if not %DateInputContainer/Month.text.is_valid_int():
				$Status.text = "error: BirthDay month must be integer"
				return false
			if not %DateInputContainer/Day.text.is_valid_int():
				$Status.text = "error: BirthDay day must be integer"
				return false
			
			var year: int = int(%DateInputContainer/Year.text)
			var month: int = int(%DateInputContainer/Month.text)
			var day: int = int(%DateInputContainer/Day.text)
			if year < 1:
				$Status.text = "error: invalid year"
				return false
			if month < 1 or month > 12:
				$Status.text = "error: invalid month"
				return false
			if day < 1 or day > 31:
				$Status.text = "error: invalid day"
				return false
			
			answers[current_index] = Time.get_unix_time_from_datetime_dict({
				year = int(%DateInputContainer/Year.text),
				month = int(%DateInputContainer/Month.text),
				day = int(%DateInputContainer/Day.text),
				hour = 0,
				minute = 0,
				second = 0,
			})
	return true

func create_player():
	var player_id: String = GameManager.get_player_id()
	var player = Player.new(player_id, answers[0], answers[1], answers[2], answers[3])
	var player_dict = Player.player_to_dictionary(player)
	await Firebase.Firestore.collection("players").add(player_id, player_dict)

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		GameManager.go_to_settings()
