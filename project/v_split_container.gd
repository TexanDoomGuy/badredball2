extends VSplitContainer
var total_height=0
func _ready() -> void:
	for child in get_children():
		if child is Control:
			total_height += child.size.y
			print(child.size.y)
			print(child)
	custom_minimum_size.y=total_height
