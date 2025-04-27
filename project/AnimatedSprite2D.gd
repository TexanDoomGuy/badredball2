extends AnimatedSprite2D
var vel=Vector2.ZERO
var prevVel=Vector2.ZERO
var random_faces = ["idle"]
var time_elapsed := 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_anything_pressed():
		time_elapsed = 0
	time_elapsed+=delta
	if randi_range(0,500) == 69:
	#if Input.is_action_just_pressed("ui_down"):
		play("blink")
	if time_elapsed >= 10:
		time_elapsed = 7
		if randi_range(0,3) == 1:
			var temp=randi_range(0,len(random_faces)-1)
			$"../AnimatedSprite2D".play(random_faces[temp])
			time_elapsed=0
