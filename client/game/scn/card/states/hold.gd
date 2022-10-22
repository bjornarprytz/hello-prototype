extends CardState

var rotationSpeed = 0.9

func update(delta: float):
	var cardCenter = card.get_center()
	var force = (get_viewport().get_mouse_position() - cardCenter) * 0.1

	var velocity = 0.9 * force
	card.position += velocity
	
	var angleTo = -card.rotation
	card.rotate(sign(angleTo) * min(delta * rotationSpeed, abs(angleTo)))
	

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && !event.is_pressed():
			state_machine.transition_to("Idle")
