extends Area2D

@export var level = "Level1"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	pass # Replace with function body.
	var error = get_tree().change_scene_to_file("res://"+level)
	if error == OK:
		get_tree().change_scene_to_file("res://"+level)
	else:
		$"..".printerror("Uh oh spaghettios. Trying to load a level that doesn't exist!")
