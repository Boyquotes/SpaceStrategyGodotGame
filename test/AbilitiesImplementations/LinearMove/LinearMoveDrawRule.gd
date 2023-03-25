extends FieldDrawRule

class_name LinearMoveDrawRule


var _fo : FieldObject
var _obstacles : CellsArea

var _initialized : bool = false

func init_params(fo:FieldObject, obsts:CellsArea):
	_fo = fo
	_obstacles = obsts
	
	_initialized = true


func _on_draw(field:GameField):
	if not _initialized:
		return
	
	
	for i in field.hex_map.get_all_map_hexes():
		if HexPlane.get_diatance(i, _fo.position) <= _fo.abilities_data[LinearMoveAbility.NAME].move_remains:
			if (not _obstacles.has_cell(i)) and Vector2i(i) != _fo.position:
				field.fill_internal_hex(i, Color(0, 1, 0, 0.2), 0.6)
	
