extends RigidBody2D
var jump_delay = 0
var can_jump = 0
var speed = 25
var jump_force = -500
var max_speed = 600
var respawn_done = 0
var spawn_point = Vector2(192, 80)
var friction = 0.001
var max_air_speed = 900
var temp = Vector2.ZERO
var l_pp = Vector2(6969,-420420)

var time=Vector2.ZERO

var fails=-1
var can_count = true

var ocd_done = 0
var ocd_started = 0

@export var no_border = true
var time_scale = 1

var on_floor = 0
var on_ground = 0

var perm_down=15
func _ready():
	Engine.time_scale = time_scale	
	spawn_point = position
	set_contact_monitor(true)#     These both allow detecting if there's coliistion with get_contact_count
	set_max_contacts_reported(999) # if this isn't set, get_contact_count will return nothing

func restart(loc):
	freeze = true
	await get_tree().create_timer(0.05).timeout
	global_position = loc
	gravity_scale = 0
	await get_tree().create_timer(0.05).timeout
	gravity_scale = 1
	freeze = false
	if can_count == true:
		fails+=1
		can_count = false
		$RespawnCounterDelay.start(0.05)
	
func _process(delta):
	time.y+=delta
	if time.y >= 60:
		time.y -= 60
		time.x+=1


func _physics_process(delta):
	

	$"../Shading".position = position
	
	if get_contact_count() >= 1:
		can_jump=1
	if get_contact_count() >= 0:
		$Timer.start(0.25)
	if Input.is_action_just_pressed("restart"):
		restart(spawn_point)
		
	if Input.is_action_pressed("jump") && can_jump == 1 && on_floor != -1:
		if on_floor == 1:
			linear_velocity.y = jump_force
			can_jump = 0
	if Input.is_action_pressed("jump") && on_floor == -1 && get_contact_count() >= 1:
		mass = 100000000
		gravity_scale = -8

	if (gravity_scale != 1 && get_contact_count() == 0)or Input.is_action_pressed("jump")!= true:
		mass=1
		gravity_scale = 1
	if Input.is_action_pressed("right"):
		if ((linear_velocity.x < max_speed) and (on_ground == 1)) or on_ground == 0:
			linear_velocity.x += speed
		if (linear_velocity.x > max_speed) && (on_ground == 1):
			linear_velocity.x = move_toward(linear_velocity.x,max_speed,(friction*10)*delta)
		
	if Input.is_action_pressed("left"):
		if ((linear_velocity.x > -max_speed) and (on_ground == 1)) or on_ground == 0:
			linear_velocity.x -= speed
		if (linear_velocity.x < -max_speed) && (on_ground == 1):
			linear_velocity.x = move_toward(linear_velocity.x,-max_speed,(friction*10)*delta)
	if linear_velocity.x > max_air_speed:
		linear_velocity.x = max_air_speed
	elif linear_velocity.x < -max_air_speed:
		linear_velocity.x = -max_air_speed
		

	$"../Camera/Camera2D/Control2/Label".text = "speed = "+str(round(linear_velocity)) #Just changes a label to equal the velocity.
	$"../Camera/Camera2D/Control2/Label2".text = "position = "+str(round(position))
	if can_jump == 1:
		$"../Camera/Camera2D/Control2/Label3".text = "can jump = True"	
	if can_jump == 0:
		$"../Camera/Camera2D/Control2/Label3".text = "can jump = False"
	var temp2=str(snapped(time.y,0.01))
	$"../Camera/Camera2D/Control2/Label4".text = "Time: "+str(snapped(time.x,1))+":"+"%0.2f" % time.y
	$"../Camera/Camera2D/Control2/Label5".text = "Fails: "+"%0.f" % fails
func _on_respawn_delay_timeoutY():
	linear_velocity.y = 0
	freeze = 1
	freeze = 0

func _on_respawn_delay_timeoutX():
	linear_velocity.x = 0
	freeze = 1
	freeze = 0

func _on_area_2d_area_entered(area):
	#linear_velocity.y = 100	
	#await get_tree().create_timer(0.05).timeout
	#linear_velocity = Vector2.ZERO	
	if no_border == false:
		restart(spawn_point)

func _on_bouncey_area_entered(area):
	if linear_velocity.y < 0:
		linear_velocity *= Vector2(-1,-1)
		linear_velocity.y += 50
		#linear_velocity.x += 300
	else:
		linear_velocity *= Vector2(-1,-1)
		linear_velocity.y -= 50
		#linear_velocity.x -= 300


func _on_timer_timeout():
	can_jump = 0


func _on_respawn_counter_delay_timeout():
	can_count = true
	


func _on_timer_2_timeout():
	if (gravity_scale != 1 && get_contact_count() == 0)or Input.is_action_pressed("jump")!= true:
		mass=1
		gravity_scale = 1
