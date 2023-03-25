extends Action

class_name CheckCollisionAction


var _fo : FieldObject
var _objects_to_collide : Array[FieldObject]


func _init(fo:FieldObject, check_objects:Array[FieldObject]):
	_fo = fo
	_objects_to_collide = check_objects.duplicate()


func _on_start():
	for i in _objects_to_collide:
		if _fo.position == i.position:
			next_actions.append(
				CollisionAction.new(_fo, i)
			)
	
	completed = true
