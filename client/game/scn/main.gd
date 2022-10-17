extends Node2D

var hand 

func _ready():
	
	var loader = $CardLoader
	
	hand = $Hand
	hand.add_card(loader.load_card())
	hand.add_card(loader.load_card())
	hand.add_card(loader.load_card())
	hand.add_card(loader.load_card())
