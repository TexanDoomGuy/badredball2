extends Control
@onready var finish = $"../../Finish"

var curlevel = "null"
var nexlevel = "null"

var endscreenhideornot = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if endscreenhideornot == 0:
		hide()
		$"../../Player".freeze = false
	else:
		show()
		$"../../Player".freeze = true
		$"../../Player".position = Vector2(6969,420420)
	if finish.level == 1:
		curlevel = "tutorial"
		nexlevel = "Level 1"
		
	if finish.level != 1:
		curlevel = "Level "+str(finish.level - 1)
		nexlevel = "Level "+str(finish.level)
	$RichTextLabel.text = "[center]"+curlevel+" completed!.[/center]

[center]Up next: "+nexlevel
	
	
		
