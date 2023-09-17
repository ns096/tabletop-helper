extends Container

@onready
var WidgetPage = get_node("WidgetPage")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func load_save():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	
	
	var scene = load("user://save_page.tscn").instantiate()
	if scene != null:
		WidgetPage.queue_free()
		add_child(scene)
		
		WidgetPage = scene
		move_child(WidgetPage,0)
		
func _on_save_pressed():
	var scene = PackedScene.new()
	set_owner_for_all(WidgetPage.get_children(),WidgetPage)
	WidgetPage.set_owner(self)
	var result = scene.pack(WidgetPage)
	if result == OK:
		var error = ResourceSaver.save(scene, "user://save_page.tscn")  # Or "user://..."
		if error != OK:
			push_error("An error occurred while saving the scene to disk.")
			

func _on_reset_pressed():
	load_save()

func set_owner_for_all(nodes,owner):
	for node in nodes:
		if node is BaseWidget:
			print(node.position)
		node.set_owner(owner)
		var children = node.get_children()
		if children.size()  > 0:
			set_owner_for_all(children,owner)
