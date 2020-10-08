extends Node


const GAME_RULES_FILE = "res://psionic/rules.txt"

const MAIN_MENU_SCENE = preload("res://scenes/ui/MainMenu.tscn")
const END_LEVEL_SCENE = preload("res://scenes/ui/LevelEnd.tscn")
const PAUSE_MENU_SCENE = preload("res://scenes/ui/PauseMenu.tscn")

const LEVEL_SELECT_SCENE = preload("res://scenes/ui/LevelSelect.tscn")
const GAME_SCENE = preload("res://scenes/game/Level.tscn")


var main_scene = null
var ui_center_slot = null

var main_menu_scene = null
var pause_menu_scene = null

var game_scene = null


#Game
var psengine;
var current_level = 0;

func _ready():
	psengine = GDPSEngine.new()
	psengine.load_game_from_file_path(GAME_RULES_FILE)

	main_scene = get_tree().get_current_scene()
	ui_center_slot = main_scene.get_node("UICanvas/UICenterContainer")
	
	open_main_menu()
	
	#get_tree().paused = true;


func _process(delta):
	return


func start_game():
	load_level(0)
	
func load_level(level_index):
	if level_index > psengine.get_level_count():
		return
	current_level = level_index;
	if game_scene != null:
		game_scene.queue_free();
		game_scene = null
	for child in ui_center_slot.get_children():
		child.queue_free()
	game_scene = GAME_SCENE.instance()
	main_scene.add_child(game_scene)
	psengine.load_level(level_index)
	get_tree().paused = false;

func open_main_menu():
	if game_scene != null:
		game_scene.queue_free()
		game_scene = null
	for child in ui_center_slot.get_children():
		child.queue_free()
	main_menu_scene = MAIN_MENU_SCENE.instance()
	ui_center_slot.add_child(main_menu_scene)

func open_level_select_menu():
	for child in ui_center_slot.get_children():
		child.queue_free()
	var level_select_menu_scene = LEVEL_SELECT_SCENE.instance()
	ui_center_slot.add_child(level_select_menu_scene)

func open_pause_menu():
	pause_menu_scene = PAUSE_MENU_SCENE.instance()
	ui_center_slot.add_child(pause_menu_scene)
	get_tree().paused = true;
		
func resume_game():
	if pause_menu_scene != null:
		for child in ui_center_slot.get_children():
			child.queue_free()
	get_tree().paused = false;

func open_level_end_menu(has_won):
	get_tree().paused = true;
	for child in ui_center_slot.get_children():
		child.queue_free()
	var end_level_scene = END_LEVEL_SCENE.instance()
	ui_center_slot.add_child(end_level_scene)
	
	
