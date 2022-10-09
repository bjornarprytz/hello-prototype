extends Node2D

const card_class = preload("res://scn/card/card-tactile.tscn")

func _ready():
	for _i in range(0, 5):
		# istance a new card with 0.1 scale and add it to the tether as a child
		var card = card_class.instance()
		card.scale = Vector2(0.1, 0.1)
		$Tether.add_child(card)
		# set the card's position to a random position
		card.position = Vector2(rand_range(0, 100), rand_range(0, 100))
