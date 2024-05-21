extends Node2D

@onready var errorme = $Camera2D/Errorm
var errordone = 1

func printerror(errorm: String):
	$Player.linear_velocity *= Vector2(-10,-1)	
	if errordone == 1:
		errordone = 0
		errorme.add_theme_color_override("font_color",Color(1,0,0,1))
		errorme.text = "Error: "+errorm		
		await get_tree().create_timer(5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.9))
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.8))
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.7))		
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.6))		
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.5))
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.4))
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.3))
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.2))		
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0.1))		
		await get_tree().create_timer(0.5).timeout
		errorme.add_theme_color_override("font_color",Color(1,0,0,0))	
		errordone = 1
	
	
