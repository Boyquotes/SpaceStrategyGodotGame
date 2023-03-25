extends Node

class_name ActionProcessor

var current : Action = null
var action_queue : Array[Action] = []


func put_action(action:Action):
	action_queue.append(action)


func _process(delta:float):
	if current == null:
		if not action_queue.is_empty():
			current = action_queue.pop_front()
			# validate
			current.start()
			for a in current.parallel_actions:
				a.start()
	else:
		current.process(delta)
		for a in current.parallel_actions:
			a.process(delta)
		
		if _is_action_completed_with_parallel(current):
			_add_to_front(current.next_actions)
			current = null


func _is_action_completed_with_parallel(action:Action):
	var res : bool = action.completed
	
	for a in action.parallel_actions:
		if not res:
			break
		
		res = res and a.completed
	
	return res



func _add_to_front(actions:Array[Action]):
	for i in range(len(actions)):
		action_queue.insert(0, actions[len(actions)-1-i])
