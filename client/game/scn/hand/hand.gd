extends Node2D

const card_class = preload("res://scn/card/card-tactile.tscn")

func _ready():
	pass

func add_card(card_data: Card.Data):
	var card = card_class.instance().init(card_data)
	card.scale = Vector2(0.2, 0.2)
	$Tether.add_child(card)
	_layout()

func _layout():
	var card_count = $Tether.get_child_count()
	var spacing = 1.0 / card_count;

	var rotatingThing = max(1, card_count - 1)

	var start = $Tether.get_points()[0]
	var end = $Tether.get_points()[1]

	for i in range(card_count):
		# Get the card
		var card = $Tether.get_child(i)
		# Space it out between the start and end
		var pos = lerp(start, end, i * spacing)
		# Position the card along the tether line with an offset on the y-axis equal to the half the height of the card
		card.position = pos
		
		# Set the card's rotation to go from -30 to 30 degrees
		card.rotation = deg2rad(-30 + 60 * i / rotatingThing)
		
