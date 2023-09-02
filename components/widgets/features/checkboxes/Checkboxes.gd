extends Control


var amountOfCheckboxes = 4
var default
@onready
var checkBox = $CheckBox
# Called when the node enters the scene tree for the first time.
func _ready():
	createLabel(label_text)
	createCheckboxes(amountOfCheckboxes)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func createLabel(label_text: String):
	if label_content != null:
		var label = $HBoxContainer/Label
		label.visible = true
		label.text = label_text
	

func createCheckboxes(amount: int):
	var Hbox = $HBoxContainer
	for i in range(amount):
		var copyOfCheckbox = checkBox.duplicate()
		copyOfCheckbox.visible = true
		copyOfCheckbox.disabled = false
		Hbox.add_child(copyOfCheckbox)
