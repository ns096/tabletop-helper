class_name BaseWidget
extends Control

var data: Array
var metadata: Dictionary
var page_steps: Vector2
var EditPopup: PopupMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	# Every widget has a popupmenu
	EditPopup = PopupMenu.new()
	add_child(EditPopup)
	EditPopup.add_check_item("Edit")
	EditPopup.add_check_item("Delete")
	EditPopup.id_pressed.connect(on_popupmenu_pressed)
	_ready_extra()
	
# overwrite this in the child class to extend the ready function
func _ready_extra():
	pass

func on_popupmenu_pressed(id: int):
	match id:
		0:
			edit()
		1:
			queue_free()

# drag functionality
const HOLD_TIME_REQUIRED = 0.55
var hold_time = HOLD_TIME_REQUIRED
var holding = false
var dragging = false
var draggable

func _process(delta):
	if holding and not dragging:
		hold_time -= delta 
		if hold_time <= 0:
			print("holding")
			hold_time = HOLD_TIME_REQUIRED
			holding = false
			draggable = true
			# Execute your code here when the user has held the control for the specified time
			EditPopup.popup_centered()
	_process_extra(delta)
	
func _process_extra(delta):
	pass

func _gui_input(event):
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT) or event is InputEventScreenTouch:
		if event.pressed:
			print("pressed Base")
			holding = true
		elif event.is_released() or !event.pressed:
			print("released")
			reset_dragging()
			snap_position()
		
	elif (event is InputEventScreenDrag or event is InputEventMouseMotion) and draggable:
		print("dragging")
		dragging = true
		position += event.relative
		accept_event()

	else:
		print("reset %s" % event)
		reset_dragging()
		snap_position()
	# call extra gui handling here
	_gui_input_extra(event)
		
# add extra gui handling here
func _gui_input_extra(event):
	pass

func reset_dragging():
	holding = false
	hold_time = HOLD_TIME_REQUIRED
	dragging = false
	draggable = false

# drag the widget
func drag():
	pass

# Update the widget position
func snap_position():
	#why doesn't it work
	position = position.snapped(page_steps)

# Build the widget 
# needs to be called after adding to the scene tree
func build(page_steps: Vector2, data: Array):
	self.page_steps = page_steps
	self.data = data
	snap_position()
	_build_extra(data)

# use this function to add additional build functionality
func _build_extra(data: Array):
	pass

# Show the widget editor
func edit():
	pass
