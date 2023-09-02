extends Control
class_name BaseFeature

var feature_name: String
var can_reset: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Return all necessary data to rebuild feature
func _get_feature_data():
	pass
	
# Reset feature data to default value or skip
func _reset_feature():
	pass
