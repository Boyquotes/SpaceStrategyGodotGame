extends Action

class_name ActionPack


func _init(iactions:Array[Action]):
	next_actions = iactions.duplicate()


func _on_start():
	completed = true
