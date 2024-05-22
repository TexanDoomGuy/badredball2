extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.restart(Vector2(258,-87))
	$Finish.level = 2
	await get_tree().create_timer(0.1).timeout
	
