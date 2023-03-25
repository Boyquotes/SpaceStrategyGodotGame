extends RefCounted

class_name CellsArea

# Класс, представляющий группу точек

var cells:Array = []

func _init(icells=[]):
	var t = icells.duplicate()
	t.sort()
	cells = t


func add_cell(cell:Vector2):
	if not has_cell(cell):
		cells.insert(cells.bsearch(cell), cell)


func add_area(area):
	for i in area.get_cells():
		add_cell(i)


func remove_cell(cell:Vector2):
	if has_cell(cell):
		var i = cells.bsearch(cell)
		cells.remove_at(i)


func has_cell(cell:Vector2) -> bool:
	var i = cells.bsearch(cell)
	return i != len(cells) and cells[i] == cell


func get_translated(by:Vector2):
	var translated = cells.duplicate()
	for i in range(len(translated)):
		translated[i] += by
	
	return _create_area_from_cells(translated)


func get_cells() -> Array:
	return cells.duplicate()


func intersect_area(collide_with:CellsArea):
	var res = []
	for i in get_cells():
		if collide_with.has_cell(i):
			res.append(i)
	
	return _create_area_from_cells(res)


func exclude_area(area:CellsArea):
	for i in area.get_cells():
		remove_cell(i)


func are_intersected(area:CellsArea):
	for i in get_cells():
		if area.has_cell(i):
			return true
	
	return false


func is_empty():
	return cells.is_empty()


func _create_area_from_cells(icells:Array):
	return get_script().new(icells)


func _to_string():
	return str(cells)
