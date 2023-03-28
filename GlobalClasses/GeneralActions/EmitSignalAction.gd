extends Action

class_name EmitSignalAction


var _signal_to_emit : Signal
var _argumenets : Array

func _init(isignal:Signal, args:Array=[]):
	_signal_to_emit = isignal
	_argumenets = args.duplicate()


func _on_start():
	_signal_to_emit.get_object().callv("emit_signal", [_signal_to_emit.get_name()]+_argumenets)
	completed = true


func _to_string():
	return "Emit signal action: " + str(_signal_to_emit.get_name())
