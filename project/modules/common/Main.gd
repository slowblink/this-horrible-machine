extends Node

@onready var hud : Control = $HUD
@onready var menu : Control = $Menu
@onready var main_3d : Node3D = $Main3D
@onready var button : Button = $Menu/Button
@onready var button2 : Button = $Menu/Button2

var level_instance : Node3D 
var player_instance : Node3D

func unload_level():
	if (is_instance_valid(level_instance)):
		level_instance.queue_free()
	level_instance = null

func load_level(level_name : String):
	unload_level()
	var level_path := "res://modules/levels/%s/%s.tscn" % [level_name, level_name]
	var level_resource := load(level_path)
	if(level_resource):
		level_instance = level_resource.instantiate()
		main_3d.add_child(level_instance)

func load_player():
	#unloadplayer?
	var player_path:= "res://addons/character-controller/example/main/player.tscn"
	var player_resource := load(player_path)
	if(player_resource):
		player_instance = player_resource.instantiate()
		main_3d.add_child(player_instance)
	
func _on_button_2_pressed():
	load_level("test_chamber")
	load_player()
	close_load_menu()

func _unhandled_input(event):
	if Input.is_action_just_pressed("quit_game"):
		print("quit now")
		get_tree().get_root().propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()

func _on_button_pressed():
	load_level("tutorial_island")
	load_player()
	close_load_menu()

func close_load_menu():
	button.queue_free()
	button2.queue_free()
	pass
