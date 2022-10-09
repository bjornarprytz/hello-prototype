extends Node2D

func _ready():
	
	randomize() # Randomize the seed

	var result = get_tree().change_scene("res://scn/main.tscn")

	if (result == OK):
		print("Game loaded successfully")
	else:
		print("Scene change failed")
