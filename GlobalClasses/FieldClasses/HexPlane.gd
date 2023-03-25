extends Object

class_name HexPlane


static func get_diatance(hex1:Vector2, hex2:Vector2):
	var dx = hex1.x - hex2.x
	var dy = hex1.y - hex2.y
	var dz = dx+dy
	return (abs(dx)+abs(dy)+abs(dz))/2


static func get_direct_hex(from:Vector2, to:Vector2):
	var dx = to.x - from.x
	var dy = to.y - from.y
	var dz = -to.x-to.y + from.x+from.y
	if dx == 0:
		return Vector2(0, sign(dy))
	elif dy == 0:
		return Vector2(sign(dx), 0)
	elif dz == 0:
		return Vector2(sign(dx), sign(dy))
	else:
		if abs(dz) > abs(dx) and abs(dz) > abs(dy):
			if abs(dx) > abs(dy):
				return Vector2(sign(dx), 0)
			else:
				return Vector2(0, sign(dy))
			
		elif abs(dy) > abs(dx):
			if abs(dz) > abs(dx):
				return Vector2(0, sign(dy))
			else:
				return Vector2(sign(dx), sign(dy))
			
		else:
			if abs(dy) > abs(dz):
				return Vector2(sign(dx), sign(dy))
			else:
				return Vector2(sign(dx), 0)


static func get_hex_neighbors(hex:Vector2):
	var neighbors = [
		hex + Vector2(0, -1),
		hex + Vector2(1, -1),
		hex + Vector2(1, 0),
		hex + Vector2(0, 1),
		hex + Vector2(-1, 1),
		hex + Vector2(-1, 0)
	]
	return neighbors


