extends VBoxContainer

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _process(delta):
	pass

func _on_ButtonStart_pressed():
	Globals.start_game();

func _on_ButtonLevelSelect_pressed():
	Globals.open_level_select_menu();

func _on_ButtonQuit_pressed():
	get_tree().quit()
