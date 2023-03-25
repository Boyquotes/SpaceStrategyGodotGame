extends Node2D

class_name FieldVisual2D

var field_position : Vector2
var handled : bool = false

func _enter_tree():
	add_to_group("FieldVisual2D")


func get_animate_ability_action(ability:String, to:Vector2i) -> Action:
	return _ability_animation(ability, to)



func _ability_animation(ability:String, to:Vector2i) -> Action:
	return null
