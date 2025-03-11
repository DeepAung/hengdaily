extends Control

func _ready() -> void:
	Firebase.Auth.login_succeeded.connect(on_sign_in_success)
	Firebase.Auth.login_failed.connect(on_sign_in_fail)

func _on_sign_in_pressed() -> void:
	var email = $VBoxContainer/Email.text
	var password = $VBoxContainer/Pwd.text
	Firebase.Auth.login_with_email_and_password(email, password)

func on_sign_in_success(auth):
	print(auth)

func on_sign_in_fail(err, msg):
	print(err)
	print(msg)
	print("success")
