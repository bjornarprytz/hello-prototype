extends CardState

func handle_input(event: InputEvent):
	if ( event is InputEventMouseButton
	&& event.button_index == BUTTON_LEFT
	&& event.is_pressed()):
		state_machine.transition_to("Hold")
		get_tree().set_input_as_handled()

func mouse_exited():
	state_machine.transition_to("Idle")
