extends Node2D
@onready var player = $Player
var prevDeath=0

# Called when the node enters the scene tree for the first time.
func _ready():
	player.spawn_point = Vector2(1069,230)
	player.restart(player.spawn_point)

func _process(delta):
	if prevDeath!= player.fails:
		$TileMap/TileMapLayer.enabled=false
	prevDeath = player.fails
	

func _on_area_2d_area_entered(area):
	$TileMap/TileMapLayer.enabled=true
