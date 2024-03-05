extends RigidBody2D
var jump_delay = 0
var can_jump = 0
var speed = 25
var jump_force = -500
var max_speed = 600
var respawn_done = 0
var spawn_point = Vector2(192, 80)

func _ready():
	set_contact_monitor(true)#     These both allow detecting if there's coliistion with get_contact_count
	set_max_contacts_reported(999) # if this isn't set, get_contact_count will return nothing

func _physics_process(delta):
	if get_contact_count() >= 1:
		$"../canJumpDelay".start(0.2)
		
	if Input.is_action_pressed("restart"):
		freeze = true
		global_position.y = 80
		global_position.x = 192
		linear_velocity = Vector2.ZERO
		gravity_scale = 0
		await get_tree().create_timer(0.1).timeout
		gravity_scale = 1
		freeze = false
		
	if get_contact_count() >= 1:
		#await get_tree().create_timer(0.1).timeout
		can_jump = 1
		
	if Input.is_action_pressed("jump") && can_jump == 1 && jump_delay == 0:
		
		if not linear_velocity.y < -300:
			linear_velocity.y = jump_force
		jump_delay = 1
		can_jump = 0
		$"../JumpDelay".start(0.1)
	
	if Input.is_action_pressed("ui_right"):
		linear_velocity.x += speed
		
	if Input.is_action_pressed("ui_left"):
		linear_velocity.x -= speed
	
	if linear_velocity.x > max_speed:
		linear_velocity.x = max_speed
	elif linear_velocity.x < -max_speed:
		linear_velocity.x = -max_speed
	
	$"../Camera2D/Label".text = str(linear_velocity) #Just changes a label to equal the velocity.
	$"../Camera2D/Label2".text = str(position)


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
