extends CardState

var rotationSpeed = 0.9

func update(_delta: float):
	var cardCenter = card.get_center()
	var mousePosition = get_viewport().get_mouse_position()
	
	print("cardCenter = ", cardCenter)
	print("mousePosition = ", mousePosition)
	
	var force = (mousePosition - cardCenter) * 0.25
	var velocity = 0.9 * force

	card.position += velocity

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && !event.is_pressed():
			state_machine.transition_to("Idle")
