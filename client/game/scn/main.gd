extends Node2D

var hand

func _ready():
	hand = $Hand
	hand.add_card()
	hand.add_card()
	hand.add_card()
	hand.add_card()
