extends HandState

func mouse_entered():
	state_machine.transition_to("Hovered")
