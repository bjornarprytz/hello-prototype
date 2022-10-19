extends Area2D


var mouse_over = false

func _ready():
	# Connect the signals used to detect if the mouse is hovering over the current Area2D
	connect("mouse_enter", self, "_mouse_over", [true])
	connect("mouse_exit",  self, "_mouse_over", [false])

func _unhandled_input(event):
	if mouse_over and event.type == InputEvent.MOUSE_BUTTON	&& event.button_index == BUTTON_LEFT and event.pressed:
		get_tree().set_input_as_handled()
		print("clicked yea!")

func _mouse_over(over):
	self.mouse_over = over
	print("clicked yea!")
