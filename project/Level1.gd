extends Node2D
@onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	player.restart(Vector2(258,-87))
	player.spawn_point = Vector2(258,-87)
	
