extends Node

var arts =  []
var names = [
	"Mystical Teachings",
	"Skyward Sword",
	"Brilliant Flare",
	"Humble Beginnings"
]
var rulesTexts = [
	"Char 5",
	"Pilfer the Graveyard",
	"Meditate 2, then Channel X",
	"Cook Dinner"
]

var costs = [1, 2, 3, 4, 5]

var colors = [
	"W",
	"U",
	"B",
	"R",
	"G"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var art_path = "res://img/art"
	
	var dir = Directory.new()

	if dir.open(art_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir() && file_name.ends_with(".png.import"): # Important to check for .import, otherwise it won't work in builds
				var path = art_path + "/" + file_name.trim_suffix(".import")
				arts.append(load(path))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


func load_card():
	var card_data = Card.Data.new()
	card_data.Name = names[randi() % names.size()]
	card_data.RulesText = rulesTexts[randi() % rulesTexts.size()]
	card_data.Cost = costs[randi() % costs.size()]
	card_data.Art = arts[randi() % arts.size()]
	card_data.ColorId = colors[randi() % colors.size()]
	
	return card_data
