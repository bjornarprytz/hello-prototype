extends Control

func _ready():
	var art_path = "res://img/art"
	
	var dir = Directory.new()

	var arts = []

	if dir.open(art_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir() && file_name.ends_with(".png"):
				arts.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")

	# Set texture to image
	var art_texture = ImageTexture.new()
	art_texture.load(art_path + "/" + arts[randi() % arts.size()])

	$Background/ArtFrame/TextureRect.texture = art_texture
