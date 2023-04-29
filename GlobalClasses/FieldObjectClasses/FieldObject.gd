extends Node

class_name FieldObject

@export_node_path
var visual_path : NodePath


signal pre_destroyed


enum Sides {
	ATTACK,
	WORLD,
	DEFENCE
}


enum BodyTypes {
	SOFT,
	SOLID
}


var position : Vector2i
var side : Sides
var body_type : BodyTypes
var abilities_data : Dictionary # ability name : ability data instance

var visual_node : FieldVisual2D


static func valid(obj) -> bool:
	return obj != null and is_instance_valid(obj)


func _ready():
	visual_node = get_node(visual_path)


func destroy():
	pre_destroyed.emit()
	
	queue_free()
