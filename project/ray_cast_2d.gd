extends RayCast2D

func _process(delta):
	rotation_degrees=0
	global_rotation_degrees=0
	if is_colliding():
		$"..".on_floor=-1
	else:
		$"..".on_floor=1
