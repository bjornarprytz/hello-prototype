class_name Hand
extends Node2D

const card_class = preload("res://scn/card/card-tactile.tscn")

var cards: Array

func _ready():
	pass


func get_cards() -> Array:
	return cards

func add_card(card_data: Card.Data):
	var card = card_class.instance().init(card_data)
	card.scale = Vector2(0.2, 0.2)
	
	get_parent().add_child(card)
	cards.append(card)
	_layout()

func _layout():
	var card_count = cards.size()
	if (card_count == 0):
		return

	# Place the cards on a line along the bottom of the screen

	var y = position.y
	var center = get_viewport_rect().size.x / 2
	for i in range(card_count):
		cards[i].position = Vector2(center + lerp(-400.0, 0.0, i), y)
