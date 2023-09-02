extends Control

@onready
var label = $CenterContainer/Label

const DEFAULT = 20
var current_amount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_amount = DEFAULT
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	label.text = str(current_amount)



func _on_plus_1_pressed():
	current_amount += 1


func _on_minus_1_pressed():
	current_amount -= 1


func _on_plus_10_pressed():
	current_amount += 10


func _on_minus_10_pressed():
	current_amount -= 10
