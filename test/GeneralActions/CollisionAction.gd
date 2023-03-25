extends Action

class_name CollisionAction


var _fo1 : FieldObject
var _fo2 : FieldObject


func _init(fo1:FieldObject, fo2:FieldObject):
	_fo1 = fo1
	_fo2 = fo2


func _on_start():
	print(_fo1.name, " collided with ", _fo2.name)
	
	completed = true
