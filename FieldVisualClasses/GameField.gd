extends Node2D

class_name GameField

@export_range(1, 10)
var map_size : int = 1

@export_range(8, 64)
var hex_size : int = 8


var hex_map:HexMap
var iso_hex_transformations:IsoHexTransformations


func _enter_tree():
	child_entered_tree.connect(_on_child_added) 
	hex_map = HexMap.new(map_size)
	iso_hex_transformations = IsoHexTransformations.new(hex_size)


func _process(delta:float):
	for i in get_children():
		if not i is FieldVisual2D:
			return
		
		i.position = iso_hex_transformations.hex2pixel(i.field_position)


func fill_hex(hex:Vector2, color:Color, antialiasing=false):
	var points = iso_hex_transformations.get_hex_vertices(hex)
	draw_polygon(points, [color])


func encircle_hex(hex:Vector2, color:Color, width=1.0, antialiasing=false):
	var points = iso_hex_transformations.get_hex_vertices(hex)
	points.append(points[0])
	draw_polyline(points, color, width, antialiasing)


func draw_internal_hex(hex:Vector2, color:Color, size:float, width=1.0, antialiasing:bool=false):
	var points = iso_hex_transformations.get_hex_vertices(hex)
	var hex_center = iso_hex_transformations.hex2pixel(hex)
	for i in range(len(points)):
		points[i] -= hex_center
		points[i] *= size
		points[i] += hex_center
	points.append(points[0])
	draw_polyline(points, color, width, antialiasing)


func fill_internal_hex(hex:Vector2, color:Color, size:float, antialiasing:bool=false):
	var points = iso_hex_transformations.get_hex_vertices(hex)
	var hex_center = iso_hex_transformations.hex2pixel(hex)
	for i in range(len(points)):
		points[i] -= hex_center
		points[i] *= size
		points[i] += hex_center
	draw_polygon(points, [color])


func _on_child_added(child:Node):
	if child is FieldDrawRule:
		draw.connect(child.draw_on.bind(self))
