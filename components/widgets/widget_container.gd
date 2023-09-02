extends MarginContainer


func _ready():
	print(get_child_count(true))

func update_size():
	if not is_inside_tree():
		return
		
	var nod = $abc
	
	var lbl = $Label
	lbl.text = "WTF"
	print(nod)
	var children = get_children(true)
	print(has_node("abc"))
	print(get_child_count(true))
	if children.size() == 0:
		return

	var min_x = 0
	var max_x = 0
	var min_y = 0
	var max_y = 0

	print(children)
	for child in children:
		var rect = child.get_global_rect()
		min_x = min(rect.position.x, min_x)
		max_x = max(rect.position.x + rect.size.x, max_x)
		min_y = min(rect.position.y, min_y)
		max_y = max(rect.position.y + rect.size.y, max_y)

	custom_minimum_size.x = max_x - min_x
	custom_minimum_size.y = max_y - min_y
