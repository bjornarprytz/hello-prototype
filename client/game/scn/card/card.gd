class_name Card
extends Node2D

class Data:
	var Name: String
	var Cost: int
	var Art: Texture
	var RulesText: String
	var ColorId: String

func init(card_data: Data) -> Card:
	$CardUI.set_art(card_data.Art)
	$CardUI.set_name(card_data.Name)
	$CardUI.set_cost(card_data.Cost)
	$CardUI.set_rules_text(card_data.RulesText)
	$CardUI.set_color(card_data.ColorId)
	return self

func get_center() -> Vector2:
	return position + ((Vector2($CardUI.rect_size.x / 2.0, $CardUI.rect_size.y / 4.0)) * scale)
