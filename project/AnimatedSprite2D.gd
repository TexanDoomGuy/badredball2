extends AnimatedSprite2D
var vel=Vector2.ZERO
var prevVel=Vector2.ZERO
var random_mouths = ["idle"]
var random_eyes = ["loss"]
var time_elapsed = 9

var lE=len(random_eyes)
var lM=len(random_mouths)

var ranPick=84
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
		ranPick=randi_range(0,lE+lM-1)
		if ranPick>lE-1:
			ranPick-=lE
			$"../AnimatedSprite2D".play(random_mouths[ranPick])
		elif ranPick <= lE-1:
			play(random_eyes[ranPick])
			
		
		
