extends Node2D
@onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	player.spawn_point = Vector2(1069,230)
	player.restart(player.spawn_point)
