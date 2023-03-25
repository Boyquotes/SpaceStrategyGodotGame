extends RefCounted

class_name HexMap

var map_size

func _init(size):
	map_size = size


func get_real_neighbors(hex:Vector2, obstacles:CellsArea=null):
	var neighs:Array = HexPlane.get_hex_neighbors(hex)
	
	var i = 0
	while i < len(neighs):
		var h:Vector2 = neighs[i]
		if not is_hex_in_map(h) or (obstacles != null and obstacles.has_cell(h)):
			neighs.remove_at(i)
		else:
			i += 1
	
	return neighs


func get_center_hex():
	return Vector2(map_size-1, int((map_size-1)/2))


func get_random_hex():
	var rand_z = int(randf_range(-map_size, map_size))
	var x_buff = map_size - abs(rand_z)
	var rand_x
	if rand_z > 0:
		rand_x = int(randf_range(-map_size, x_buff))
	else:
		rand_x = int(randf_range(-x_buff, map_size))
	var y = -rand_x - rand_z

	return Vector2(rand_x, y) + get_center_hex()


func get_all_map_hexes():
	var start:Vector2i = Vector2i(map_size-1, -int(map_size/2))
	var res:Array = []
	while is_hex_in_map(start):
		for i in get_line_along_direction(start, Vector2i(1, 0)):
			res.append(i)
	
		start.y += 1
	
	return res


func get_diagonal_size():
	return int(map_size*2 - 1)


func get_map_bounds_along_direction(hex:Vector2, direct_hex:Vector2, inside:bool=true):
	assert(_is_hex_direct(direct_hex))
	
	var first:Vector2 = hex
	var second:Vector2 = hex
	
	while is_hex_in_map(first):
		first += direct_hex
	
	if inside:
		first -= direct_hex
	
	while is_hex_in_map(second):
		second -= direct_hex
	
	if inside:
		second += direct_hex
	
	return [first, second]


func get_line_along_direction(hex:Vector2, direct_hex:Vector2):
	assert(_is_hex_direct(direct_hex))
	
	var slider:Vector2 = hex
	
	var res:Array = []
	
	while is_hex_in_map(slider):
		res.append(slider)
		slider += direct_hex
	
	slider = hex - direct_hex
	
	while is_hex_in_map(slider):
		res.append(slider)
		slider -= direct_hex
	
	return res


func get_direct_to_center_hex(hex:Vector2):
	return HexPlane.get_direct_hex(hex, get_center_hex())


func cast_ray(hex:Vector2, direction:Vector2, obstacles:CellsArea=null, include:bool=true):
	assert(_is_hex_direct(direction))
	
	var next = hex + direction
	while is_hex_in_map(next) and not obstacles.has_cell(next):
		next += direction
	
	if not include:
		next -= direction
	
	return next


func is_hex_in_map(hex:Vector2):
	var center = get_center_hex()
	var diag = get_diagonal_size()
	hex -= center
	if hex.y < 0:
		return hex.x >= -diag/2+abs(hex.y) and hex.x <= diag/2 and hex.y >= -diag/2 and hex.y <= diag/2
	else:
		return hex.x >= -diag/2 and hex.x <= diag/2-abs(hex.y) and hex.y >= -diag/2 and hex.y <= diag/2


func _is_hex_direct(hex:Vector2):
	return HexPlane.get_diatance(Vector2(0, 0), hex) == 1
