extends RefCounted

class_name MoveArea


var came_from:Dictionary = {}


func set_came_from(from:Vector2, to:Vector2):
	came_from[to] = from


func has_cell(cell):
	return cell in came_from.keys()


func get_available_cells():
	return came_from.keys()


func get_move_distance(to:Vector2):
	assert(to in came_from.keys())
	
	var dist:int = 0
	var current:Vector2 = to
	
	while came_from.get(current) != null:
		dist += 1
		current = came_from.get(current)
	
	return dist


func get_move_path(to:Vector2):
	assert(to in came_from.keys())
	
	var path:Array = []
	var current:Vector2 = to
	
	while came_from.get(current) != null:
		path.append(current)
		current = came_from.get(current)
	
	path.reverse()
	
	return path
