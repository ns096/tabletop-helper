extends BaseWidget

@onready
var container = $VBoxContainer

@onready
var label_template = $Label

@onready
var checkbox_template = $CheckBox



const LABEL = "label_content"
const NUMBER_OF_CHECKBOXES = "number_of_checkboxes"
const default = [
		{
			LABEL: "Torches",
			NUMBER_OF_CHECKBOXES: 3
		},
		{
			LABEL: "Thieves Luck",
			NUMBER_OF_CHECKBOXES: 0
		},
		{
			LABEL: "",
			NUMBER_OF_CHECKBOXES: 5
		}
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_popup()
	construct_widget(default)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_hold(delta)

func build(pageSteps: Vector2, pagePosition: Vector2):
	pass

func _gui_input(event):
	_hold_input(event)
	
func construct_widget(widget_data:Array):
	for data in widget_data:
		create_row(data.label_content, data.number_of_checkboxes)


func create_row(label_content: String,number_of_checkboxes: int):
	var hbox = HBoxContainer.new()
	container.add_child(hbox)
	if not label_content.is_empty():
		var label = label_template.duplicate()
		label.text = label_content
		label.visible = true
		hbox.add_child(label)
	if number_of_checkboxes > 0:
		for i in range(number_of_checkboxes):
			var checkbox = checkbox_template.duplicate()
			checkbox.disabled = false
			checkbox.visible = true
			hbox.add_child(checkbox)
