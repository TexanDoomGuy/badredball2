extends Area2D

@onready var player = $"../Player"
var level = 1

func _on_area_entered(area):
	var errorr = get_tree().change_scene_to_file("res://Level "+str(level)+".tscn")
	print(errorr)
	if errorr != OK:
		$"..".printerror('Uh oh spaghettios. Level '+"res://Level "+str(level)+".tscn"+" doesn't"+' exist!	Error code: '+str(errorr))
	else:
		$"../Camera2D/Control".endscreenhideornot = 1
		$"../pain".start(5)
		await $"../pain".timeout
		$"../Camera2D/Control".endscreenhideornot = 0
		get_tree().change_scene_to_file("res://Level "+str(level)+".tscn")
	


func _on_pain_timeout():
	pass # Replace with function body.
	print("ass")
