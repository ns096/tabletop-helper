class_name BaseWidget
extends Control

var data: Dictionary
var metadata: Dictionary
var EditPopup: PopupMenu

const HOLD_TIME_REQUIRED = 0.55
var hold_time = HOLD_TIME_REQUIRED
var holding = false

# Called when the node enters the scene tree for the first time.
func _init_popup():
	EditPopup = PopupMenu.new()
	add_child(EditPopup)
	EditPopup.add_check_item("Edit")
	EditPopup.add_check_item("Delete")
	EditPopup.id_pressed.connect(on_popupmenu_pressed)


func on_popupmenu_pressed(id: int):
	match id:
		0:
			edit()
		1:
			queue_free()

func _hold(delta):
	if holding:
		hold_time -= delta 
		if hold_time <= 0:
			print("holding")
			hold_time = HOLD_TIME_REQUIRED
			holding = false
			# Execute your code here when the user has held the control for the specified time
			EditPopup.popup_centered()

func _hold_input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("pressed Base")
				holding = true
	else:
		holding = false

# drag the widget
func drag():
	pass

# Update the widget position
func update_position(pagePosition: Vector2):
	pass
	
# Build the widget 
func build(pageSteps: Vector2, pagePosition: Vector2):
	pass

# Show the widget editor
func edit():
	pass
