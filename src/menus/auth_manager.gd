extends Control

var isWeb : bool = Utilities.is_web();
 # มี 2 ที่ : auth_manager.gd กับใน home_menu.gd
# usage : _ready(), _on_FirebaseAuth_login_succeeded
var mode: String = ""

func _ready():
	if (isWeb) : # load auth infomation from localStorage
		var json = JSON.new()
		var authToken = JavaScriptBridge.eval("localStorage.getItem('auth_token');");
		if (authToken != null) :
			var json_parse_result = json.parse(authToken)
			if json_parse_result == OK:
				var encrypted_file_data = json.data
				Firebase.Auth.manual_token_refresh(encrypted_file_data)
	else : # load auth infomation from .env file
		if Firebase.Auth.check_auth_file():
			var auth = Firebase.Auth.auth
			_on_FirebaseAuth_login_succeeded(auth)
			return
	
	Firebase.Auth.login_succeeded.connect(_on_FirebaseAuth_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(_on_FirebaseAuth_login_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)
	
func _on_log_in_pressed():
	$Click.play()
	$Status.text =  "login...."
	var email = $VBoxContainer/Email.text
	var password = $VBoxContainer/Password.text
	mode = "signin"
	Firebase.Auth.login_with_email_and_password(email, password)
	
func _on_register_pressed():
	$Click.play()
	var email = $VBoxContainer/Email.text
	var password = $VBoxContainer/Password.text
	var confirmPassword = $VBoxContainer/ConfirmPassword.text
	mode = "signup"
	if(password != confirmPassword):
		on_signup_failed("Passwords don't match", "Passwords don't match")
	else:
		Firebase.Auth.signup_with_email_and_password(email, password)


func _on_FirebaseAuth_login_succeeded(auth):
	$LoadingPanel.show()
	if (isWeb):
		var authToken : String = JSON.stringify(auth);
		JavaScriptBridge.eval("localStorage.setItem('auth_token', '" + authToken + "');");
	else:
		var succeeded = Firebase.Auth.save_auth(auth)
		if not succeeded: # TODO: handle error
			print("not succeeded")
	
	$Status.text =  "login successfully"
	GameManager.auth = auth
	if mode == "signup":
		$LoadingPanel.hide()
		get_tree().change_scene_to_file("res://src/menus/question_menu.tscn")
	else: # mode == "signin"
		# check if player exist. if not, goto question_menu to complete the registeration
		var result = await Firebase.Firestore.collection("players").get_doc(GameManager.get_player_id())
		$LoadingPanel.hide()
		print("result: ", result)
		if result == null:
			get_tree().change_scene_to_file("res://src/menus/question_menu.tscn")
		else:
			get_tree().change_scene_to_file("res://src/menus/home_menu.tscn")

	
func on_login_failed(error_code, message):
	print("error code: " + str(error_code))
	print("message: " + str(message))
	$Status.text =  "login failed"

func on_signup_failed(error_code, message):
	print("error code: " + str(error_code))
	print("message: " + str(message))
	$Panel/Status.text = str(message)

func _on_link_to_sign_up_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menus/signup_menu.tscn")

func _on_link_to_sign_in_pressed() -> void:
	get_tree().change_scene_to_file("res://src/menus/signin_menu.tscn")

func _on_sign_in_btn_mouse_entered() -> void:
	$"Hover-card".play()

func _on_sign_up_btn_mouse_entered() -> void:
	$"Hover-card".play()
	
func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		GameManager.go_to_settings()
