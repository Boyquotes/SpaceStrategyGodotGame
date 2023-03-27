extends Action

class_name ActionPack

var actions_count : int 

func _init(iactions:Array[Action]):
	next_actions = iactions.duplicate()
	actions_count = len(iactions)


func _on_start():
	completed = true


func _to_string():
	return "Action Pack with %s actions" % actions_count
