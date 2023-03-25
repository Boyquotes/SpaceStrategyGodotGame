extends RefCounted

class_name IsoHexTransformations

var _grid_basis:Transform2D
var _hex_basis:Transform2D
var _inverted_hex_basis:Transform2D


func _init(hex_size:int):
	var short = hex_size * sqrt(3)/2
	var long = hex_size/2
	
	var pw = int(long*cos(PI/4))
	var ph = int(short*cos(PI/4))
	
	_grid_basis = Transform2D()
	_hex_basis = Transform2D()
	
	_grid_basis.x = Vector2(pw, pw/2)
	_grid_basis.y = Vector2(-ph, ph/2)
	
	_hex_basis.x = _grid_basis.x*3 + _grid_basis.y
	_hex_basis.y = _grid_basis.y*2
	
	_inverted_hex_basis = _hex_basis.affine_inverse()


func round_hex(hex:Vector2):
	var rx = round(hex.x)
	var ry = round(hex.y)
	var rz = round(-hex.x-hex.y)
	
	var x_diff = abs(hex.x-rx)
	var y_diff = abs(hex.y-ry)
	var z_diff = abs(-hex.x-hex.y-rz) 
	
	if x_diff > y_diff and x_diff > z_diff:
		rx = -ry-rz
	elif y_diff > z_diff:
		ry = -rx-rz
		
	return Vector2(rx, ry)


func pixel2hex(pixel:Vector2):
	return round_hex(_inverted_hex_basis * pixel)


func hex2pixel(hex:Vector2):
	return _hex_basis * hex
	

func get_hex_vertices(hex:Vector2):
		var pixel = hex2pixel(hex)
		return [
			pixel+2*_grid_basis.x,
			pixel+_grid_basis.x+_grid_basis.y,
			pixel-_grid_basis.x+_grid_basis.y,
			pixel-2*_grid_basis.x,
			pixel-_grid_basis.x-_grid_basis.y,
			pixel+_grid_basis.x-_grid_basis.y
		]


func get_nearest_hex_center(pixel:Vector2):
	return hex2pixel(pixel2hex(pixel))
