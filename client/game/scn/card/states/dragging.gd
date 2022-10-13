extends CardState


func update(delta: float):
	card.position = get_viewport().get_mouse_position()
