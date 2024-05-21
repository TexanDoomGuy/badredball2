extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if randi_range(0,500) == 5:
	#if Input.is_action_just_pressed("ui_down"):
		play("default")
	if frame == 6:
		stop()
