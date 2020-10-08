extends VBoxContainer

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
	var level_count = Globals.psengine.get_level_count();
	var grid_width = ceil(sqrt(level_count));
	
	$GridContainer.columns = grid_width;
	
	for i in range(0,level_count):
		var button = Button.new();
		button.text = str(i+1)
		button.connect("pressed",self, "level_button_pressed", [i])
		$GridContainer.add_child(button)

func level_button_pressed(level_idx):
	print("loading level "+str(level_idx))
	Globals.load_level(level_idx)

func _on_ButtonMainMenu_pressed():
	Globals.open_main_menu();
