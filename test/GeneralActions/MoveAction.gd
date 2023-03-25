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
