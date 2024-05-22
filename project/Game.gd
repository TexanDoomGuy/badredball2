extends Node2D

@export var overide_level = 0

func _ready():
	if overide_level != 0:
		get_tree().change_scene_to_file("res://Level "+str(overide_level)+".tscn")
