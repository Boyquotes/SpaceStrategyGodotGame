extends Object

class_name FieldObjectFactory

static func get_instance(scene:PackedScene, position:Vector2i, side:FieldObject.Sides) -> FieldObject:
	var object : FieldObject = scene.instantiate()
	
	object.position = position
	object.side = side
	
	
	return object
