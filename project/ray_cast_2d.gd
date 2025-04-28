extends RayCast2D

func _process(delta):
	rotation_degrees=0
	global_rotation_degrees=0
	if is_colliding():
		$"..".on_floor=-1
		if ($"..".linear_velocity.y <= -600) and (Input.is_action_pressed("jump") != true):
			$"../Sprites/Eyes".play("owwie")
			
	else:
		$"..".on_floor=1
