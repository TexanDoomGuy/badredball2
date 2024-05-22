extends RigidBody2D
var jump_delay = 0
var can_jump = 0
var speed = 25
var jump_force = -500
var max_speed = 600
var respawn_done = 0
var spawn_point = Vector2(192, 80)

var l_pp = Vector2(6969,-420420)

var ocd_done = 0
var ocd_started = 0

@export var no_border = true
@export var time_scale = 0.25

var on_celing = 0
	

func _ready():
	spawn_point = position
	set_contact_monitor(true)#     These both allow detecting if there's coliistion with get_contact_count
	set_max_contacts_reported(999) # if this isn't set, get_contact_count will return nothing

func restart(loc):
	freeze = true
	await get_tree().create_timer(0.05).timeout
	$"../Camera2D".position_smoothing_enabled = false
	global_position = loc
	$"../Camera2D".position_smoothing_enabled = true		
	gravity_scale = 0
	await get_tree().create_timer(0.2).timeout
	gravity_scale = 1
	freeze = false
	
func _process(delta):
	Engine.time_scale = time_scale	
	if get_contact_count() == 0:
		await get_tree().create_timer(0.1).timeout
		gravity_scale = 1
		mass = 1
	if ocd_done == 1:
		ocd_done = 0
		await get_tree().create_timer(0.1).timeout
		on_celing = 0
func _physics_process(delta):

	$"../Shading".position = position
	
	if get_contact_count() >= 1:
		$"../canJumpDelay".start(0.1)

		
	if Input.is_action_pressed("restart"):
		restart(spawn_point)
		
	if get_contact_count() >= 1:
		#await get_tree().create_timer(0.1).timeout
		can_jump = 1
		
	if Input.is_action_pressed("jump") && can_jump == 1:
		if on_celing == 0:
			if not linear_velocity.y < -300:
				linear_velocity.y = jump_force
			can_jump = 0
	if Input.is_action_pressed("jump") && on_celing == 1:
		mass = 100000000
		gravity_scale = -1
	if not Input.is_action_pressed("jump"):
		gravity_scale = 1
	if Input.is_action_pressed("right"):
		linear_velocity.x += speed
		
	if Input.is_action_pressed("left"):
		linear_velocity.x -= speed
	
	if linear_velocity.x > max_speed:
		linear_velocity.x = max_speed
	elif linear_velocity.x < -max_speed:
		linear_velocity.x = -max_speed
	
	$"../Camera2D/Label".text = str(linear_velocity) #Just changes a label to equal the velocity.
	$"../Camera2D/Label2".text = str(position)
	$"../Camera2D/Label3".text = str(on_celing)	


func _on_jump_delay_timeout():
	jump_delay = 0


func _on_can_jump_delay_timeout():
	can_jump = 0


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
		freeze = true
		await get_tree().create_timer(0.05).timeout
		$"../Camera2D".position_smoothing_enabled = false
		global_position = spawn_point
		$"../Camera2D".position_smoothing_enabled = true		
		gravity_scale = 0
		await get_tree().create_timer(0.2).timeout
		gravity_scale = 1
		freeze = false


func _on_celingcheck_area_entered(area):
	on_celing = 1


func _on_celingcheck_area_exited(area):
	ocd_done = 1
	ocd_started = 0
	


func _on_on_celing_delay_timeout():
	on_celing = 0


func _on_celingcheck_2_area_entered(area):
	if Input.is_action_pressed("jump"):
		linear_velocity.y = -250


func _on_ceiling_area_entered(area):
	on_celing = 1


func _on_ceiling_area_exited(area):
	ocd_done = 1
	ocd_started = 0


func _on_bouncey_area_entered(area):
	linear_velocity *= Vector2(-10,-1)
