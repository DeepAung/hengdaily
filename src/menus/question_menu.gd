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
	0,
	0.0,
	0
]

func _ready() -> void:
	# TODO: check if auth exist. if not, error and go back to signin_menu
	render()

func _on_next_pressed() -> void:
	set_answer()
	current_index += 1
	if current_index == len(questions):
		create_player()
		get_tree().change_scene_to_file("res://src/menus/game_scene.tscn")
	else:
		render()

func _on_previous_pressed() -> void:
	current_index -= 1
	if current_index < 0:
		current_index = 0
	render()

func render() -> void:
	$Question.text = questions[current_index]
	%Answer.text = str(answers[current_index])
	
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

func set_answer() -> void:
	# TODO: check if type casting has error. if it has, error and let user input again.
	match current_index:
		0:
			answers[current_index] = %Answer.text
		1:
			answers[current_index] = int(%Answer.text)
		2:
			answers[current_index] = float(%Answer.text)
		3:
			answers[current_index] = Time.get_unix_time_from_datetime_dict({
				year = int(%DateInputContainer/Year.text),
				month = int(%DateInputContainer/Month.text),
				day = int(%DateInputContainer/Day.text),
				hour = 0,
				minute = 0,
				second = 0,
			})

func create_player():
	var player_id: String = GameManager.get_player_id()
	var player = Player.new(player_id, answers[0], answers[1], answers[2], answers[3])
	var player_dict = Player.player_to_dictionary(player)
	await Firebase.Firestore.collection("players").add(player_id, player_dict)
