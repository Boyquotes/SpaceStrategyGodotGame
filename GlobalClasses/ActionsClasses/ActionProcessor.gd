extends Node

class_name ActionProcessor


signal next_action_picked
signal current_completed
signal action_added

@export
var handmode : bool = false

var current : Action = null
var action_queue : Array[Action] = []

var _allow_push_while_handmode : bool = false


func put_action(action:Action):
	action_queue.append(action)
	action_added.emit()


func _process(delta:float):
	if current == null:
		if handmode and not _allow_push_while_handmode:
			return
		
		if not action_queue.is_empty():
			current = action_queue.pop_front()
			current.start()
			
			for a in current.parallel_actions:
				a.start()
			
			next_action_picked.emit()
	else:
		current.process(delta)
		
		for a in current.parallel_actions:
			a.process(delta)
		
		if _is_action_completed_with_parallel(current):
			_add_to_front(current.next_actions)
			current = null
			
			current_completed.emit()
	
	_allow_push_while_handmode = false


func toggle_handmode():
	handmode = not handmode


func push_queue_in_hand_mode():
	_allow_push_while_handmode = true


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
		
		action_added.emit()
