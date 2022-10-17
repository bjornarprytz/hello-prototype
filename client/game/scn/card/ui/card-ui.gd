extends Control

func set_art(texture: Texture):
	$Art.texture = texture

func set_name(name: String):
	$HeaderPanel/Name.text = name

func set_cost(cost: int):
	$HeaderPanel/CostPanel/Cost.text = str(cost)

func set_rules_text(rules_text: String):
	$RulesTextPanel/RulesText.text = rules_text

