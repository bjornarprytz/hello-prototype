extends CardState

var rotationSpeed = 0.9

func update(_delta: float):
	var mousePosition = get_viewport().get_mouse_position()
	
	card.position = lerp(card.position, mousePosition, 0.1)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && !event.is_pressed():
			state_machine.transition_to("Idle")
