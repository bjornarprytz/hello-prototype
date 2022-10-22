extends CardState

func mouse_entered():
	state_machine.transition_to("Hover")
