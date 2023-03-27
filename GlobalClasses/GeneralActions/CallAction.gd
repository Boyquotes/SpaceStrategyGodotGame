extends Action

class_name CallAction


var _function_to_call : Callable
var _arguments : Array


func _init(function:Callable, args:Array=[]):
	_function_to_call = function
	_arguments = args.duplicate()


func _on_start():
	_function_to_call.callv(_arguments)
	
	completed = true


func _to_string():
	return "Call action: {0}".format([_function_to_call.get_method()])
