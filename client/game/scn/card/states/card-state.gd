class_name CardState
extends State

var card: Card

func _ready():
	# Wait for the card to be ready first
	yield(owner, "ready")
	card = owner as Card
	
	assert(card != null)

