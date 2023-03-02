extends Node

@onready var hud : Control = $HUD
@onready var menu : Control = $Menu
@onready var main_3d : Node3D = $Main3D
@onready var camera : Camera3D = $Main3D/Camera3D
@onready var button : Button = $Menu/Button2

var level_instance : Node3D 

func _ready():
	pass 

func unload_level():
	if (is_instance_valid(level_instance)):
		level_instance.queue_free()
	level_instance = null

func load_level(level_name : String):
	unload_level()
	var level_path := "res://modules/levels/%s/%s.tscn" % [level_name, level_name]
	print(level_path)
	var level_resource := load(level_path)
	if(level_resource):
		level_instance = level_resource.instantiate()
		main_3d.add_child(level_instance)

func _on_button_2_pressed():
	load_level("test_chamber")
	button.queue_free()
