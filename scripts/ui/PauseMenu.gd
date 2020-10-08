extends VBoxContainer

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Globals.resume_game();

func _on_ButtonResume_pressed():
	Globals.resume_game();

func _on_ButtonMainMenu_pressed():
	Globals.open_main_menu();

