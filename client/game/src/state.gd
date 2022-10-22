# Virtual base class for all states.
class_name State
extends Node

var state_machine = null

func handle_input(_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func mouse_entered() -> void:
	pass
	
func mouse_exited() -> void:
	pass

func enter(_msg := {}) -> void:
	pass

func exit() -> void:
	pass
