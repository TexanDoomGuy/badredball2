extends Area2D

var next_level_number = 69
var current_scene = "null"
var next_level = "null"
var error = 696969

@export var No_levels_after = 1

const filestart = "res://Level "

@onready var errorme = $"../Camera2D/Errorm"
var errordone = 1

func printerror(errorm: String):
	$"../Player".linear_velocity *= Vector2(-10,-1)	
	if errordone == 1:
		errordone = 0
		errorme.add_theme_color_override("font_color",Color(1,0,0,1))
		errorme.text = "Error: "+errorm		
		await get_tree().create_timer(5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0))	
		errordone = 1

func _on_area_entered(area):
	current_scene = get_tree().current_scene.scene_file_path
	print(current_scene)
	if current_scene != "res://Game.tscn":
		next_level_number = current_scene.to_int() + 1
	else:
		next_level_number = 1
	if current_scene != "res://Game.tscn":
		next_level = filestart + str(next_level_number) + ".tscn"
	else:
		next_level = filestart+"1.tscn"
	if  next_level_number > No_levels_after:
		printerror("Can't load "+next_level+". It doesn't exist!")
	else:
		get_tree().change_scene_to_file(next_level)
		
	
