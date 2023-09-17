extends Container

var COLUMNS = 4
var ROWS = 6
var widgets = []

const HOLD_TIME_REQUIRED = 0.6
var event_position: Vector2

var page_steps: Vector2

@export
var widget_types: Array[Resource]

@onready
var AddWidgetPopup: PopupMenu = $AddWidgetPopup

func _ready():

	var parent = get_parent()
	page_steps.x = int(parent.size.x / COLUMNS)
	page_steps.y = int(parent.size.y / ROWS)
	for item in AddWidgetPopup.item_count:
		
		AddWidgetPopup.remove_item(item)
		
	for widget in $AllWidgets.get_children():
		AddWidgetPopup.add_check_item(widget.name)
	AddWidgetPopup.id_pressed.connect(_on_popupmenu_pressed)
#	for i in range(10):
#		createRandomWidget(i)
	# updateWidgetPositions()

var holding = false
var hold_time = HOLD_TIME_REQUIRED  # Adjust the time threshold as needed


func _process(delta):
	if holding:
		hold_time -= delta 
		if hold_time <= 0:
			hold_time = HOLD_TIME_REQUIRED
			holding = false
			event_position = get_viewport().get_mouse_position()
			# Execute your code here when the user has held the control for the specified time
			popup()

func _gui_input(event):
	if ((event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT) or event is InputEventScreenTouch):
		if event.pressed:
			holding = true
	else:
		holding = false

func popup():
	AddWidgetPopup.popup_centered()

# DEV
func createRandomWidget(index):
	# random test
	var widget =  widget_types.pick_random().instantiate()
	var container = preload("res://components/widgets/widget_container.tscn").instantiate()
	# widget.text = "Widget " + str(index)
	# container.size = widgetSize
	# widget.pressed.connect(_on_Widget_pressed, index)
	container.get_node("abc").add_child(widget)
	
	# it's possible to scale widget to fit
	# container.scale *= 0.8
	add_child(container)
	widgets.append(container)

func _on_Widget_pressed(index):
	print("Widget " + str(index) + " pressed")
	# Add your custom logic here for what happens when a widget is pressed

# widgets manage their own position
func updateWidgetPositions():
	var position = Vector2()
	for i in range(widgets.size()):
		var widget = widgets[i]
		widget.update_size()
		
		var xpos = (i % COLUMNS)
		var ypos = int(i / COLUMNS)
		
		position.x = xpos * page_steps.x
		position.y = ypos * page_steps.y
		widget.position = position


func _on_popupmenu_pressed(id: int):
	var path = ""

	var Widget =$AllWidgets.get_child(id).duplicate()
	# get panel container
	var WidgetScript: BaseWidget = Widget.get_node("PanelContainer")

	print(Widget)
	add_child(Widget)
	Widget.owner = self
	# change widget data after adding to the tree
	Widget.global_position = event_position
	WidgetScript.build(page_steps, [])
	
	
