extends RefCounted

class_name Action


var completed : bool = false
var next_actions : Array[Action] = []
var parallel_actions : Array[Action] = []


func add_parallel_action(action:Action):
	parallel_actions.append(action)


func process(delta:float):
	_on_process(delta)


func start():
	_on_start()


func can_perform() -> bool:
	return _can_perform()


# virtual
func _on_process(delta:float):
	pass

# virtual
func _on_start():
	pass

# virtual
func _can_perform() -> bool:
	return true


func _to_string():
	return "Unnamed action"
