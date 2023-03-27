extends Action

class_name MoveAction


var _fo : FieldObject
var _to : Vector2i


func _init(fo:FieldObject, to:Vector2i):
	_fo = fo
	_to = to


func _on_start():
	_fo.position = _to
	
	completed = true


func _can_perform():
	return FieldObject.valid(_fo)


func _to_string():
	return "Move action: {0} to {1}".format([_fo.name, str(_to)])
