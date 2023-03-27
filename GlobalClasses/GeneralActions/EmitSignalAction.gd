extends Action

class_name EmitSignalAction


var _signal_to_emit : Signal


func _init(isignal:Signal):
	_signal_to_emit = isignal


func _on_start():
	_signal_to_emit.emit()
	completed = true


func _to_string():
	return "Emit signal action: " + str(_signal_to_emit.get_name())
