extends Node2D

@onready var errorme = $Camera2D/Errorm
var errordone = 1

func printerror(errorm: String):
	$Player.linear_velocity *= Vector2(-10,-1)	
	if errordone == 1:
		errordone = 0
		errorme.add_theme_color_override("font_color",Color(1,0,0,1))
		errorme.text = "Error: "+errorm		
		$pain.start(2.5)
		await $pain.timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0))	
		errordone = 1
	
	
