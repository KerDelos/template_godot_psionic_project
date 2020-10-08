extends VBoxContainer

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _on_ButtonNextLevel_pressed():
	Globals.load_level(Globals.current_level + 1)

func _on_ButtonRestart_pressed():
	Globals.load_level(Globals.current_level)

func _on_ButtonMainMenu_pressed():
	Globals.open_main_menu();
