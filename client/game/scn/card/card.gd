
class_name Card
extends Node2D

func _ready():
	pass


func _on_CardUI_gui_input(event):
	print("Card input event")
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed():
				# write to console
				print("Card Clicked")
				$StateMachine.transition_to("Dragging")
			else:
				$StateMachine.transition_to("Idle")

