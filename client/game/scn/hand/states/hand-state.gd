class_name HandState
extends State

var hand: Hand

func _ready():
	yield(owner, "ready")
	hand = owner as Hand
	
	assert(hand != null)
