extends Node

class_name FieldObjectMap



func add_object(fo:FieldObject):
	add_child(fo)
	
	if fo.visual_node != null:
		fo.visual_node.field_position = Vector2(fo.position)


func get_all_objects():
	return get_children()


func get_soft_objects():
	pass


func get_solid_objects():
	pass


func get_first_object_on_cell(cell:Vector2i):
	for i in get_all_objects():
		if i.position == cell:
			return i


func get_solid_objects_cells_area() -> CellsArea:
	var res : CellsArea = CellsArea.new()
	
	for i in get_all_objects():
		if i.body_type == FieldObject.BodyTypes.SOLID:
			res.add_cell(i.position)
	
	return res
