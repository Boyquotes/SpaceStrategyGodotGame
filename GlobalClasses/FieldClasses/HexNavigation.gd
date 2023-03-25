extends Object

class_name HexNavigation

static func get_distance_area(map:HexMap, hex:Vector2, distance:int, obsts:CellsArea=null):
	var res:MoveArea = MoveArea.new()
	
	var queue = []
	queue.append(hex)
	
	var dists = {}
	dists[hex] = 0
	
	while len(queue) > 0:
		var current = queue.pop_front()
		
		for i in map.get_real_neighbors(current, obsts):
		
			var new_dist = dists[current] + 1
			
			if new_dist < dists.get(i, distance+1):
				dists[i] = new_dist
				res.set_came_from(current, i)
				queue.append(i)
	
	return res


