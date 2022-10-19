extends CardState

var is_hovered: bool

func _ready():
	pass # Replace with function body.

func handle_input(event: InputEvent):
	if (is_hovered
	&& event is InputEventMouseButton
	&& event.button_index == BUTTON_LEFT 
	&& event.is_pressed()):
		state_machine.transition_to("Hold")
		get_tree().set_input_as_handled()

func mouse_entered():
	is_hovered = true

func mouse_exited():
	is_hovered = false
