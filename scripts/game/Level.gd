extends Node2D


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Globals.open_pause_menu();

func _process(delta):
	var player_move_deltas = []
	if Input.is_action_just_pressed("ps_up"):
		player_move_deltas = Globals.psengine.send_input("up")
	if Input.is_action_just_pressed("ps_down"):
		player_move_deltas = Globals.psengine.send_input("down")
	if Input.is_action_just_pressed("ps_left"):
		player_move_deltas = Globals.psengine.send_input("left")
	if Input.is_action_just_pressed("ps_right"):
		player_move_deltas = Globals.psengine.send_input("right")
	if Input.is_action_just_pressed("ps_undo"):
		Globals.psengine.send_input("undo");
	if Input.is_action_just_pressed("ps_restart"):
		Globals.psengine.send_input("restart");
		
	refresh_display();

func refresh_display():
	var image = Globals.psengine.get_texture_for_display()
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	#ResourceSaver.save("res://saved_texture.tres", texture)
	#for some reason sometimes it didn't work before saving it as a texture and using the saved texture in the sprite
	$Sprite.set_texture(texture);
