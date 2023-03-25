extends Action

class_name DeleteFieldObjectAction


var _fo : FieldObject


func _init(fo:FieldObject):
	_fo = fo


func _on_start():
	_fo.queue_free()
	
	completed = true
