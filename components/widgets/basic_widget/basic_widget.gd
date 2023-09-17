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

	
func _build_extra(data:Array):
	if data.is_empty():
		data = default
	for feature in data:
		create_row(feature.label_content, feature.number_of_checkboxes)

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
