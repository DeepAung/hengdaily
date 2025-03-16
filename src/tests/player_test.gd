extends Node

func _ready() -> void:
	for i in range(100):
		var id = generate_word("abcdefghijklmnopqrstuvwxyz0123456789", 7)
		var display_name = generate_word("abcdefghijklmnopqrstuvwxyz0123456789", 7)
		var age = randi() % 30
		var gpa = randf() * 4
		var birthday = randi()
		var player = Player.new(id, display_name, age, gpa, birthday)
		print(player.luck_love, " ", player.luck_study, " ", player.luck_health, " ", player.luck_money)


func generate_word(chars, length):
	var word: String
	var n_char = len(chars)
	for i in range(length):
		word += chars[randi()% n_char]
	return word
