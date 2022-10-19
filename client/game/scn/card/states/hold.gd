extends CardState


func update(delta: float):
	card.position = get_viewport().get_mouse_position()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && !event.is_pressed():
			state_machine.transition_to("Idle")
