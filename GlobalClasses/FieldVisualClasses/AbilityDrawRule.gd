extends FieldDrawRule

class_name AbilityDrawRule


var applying : bool = false


func go_applying_mode(fo:FieldObject, to:Vector2i):
	applying = true
	_enter_applying_mode(fo, to)


func go_waiting_mode(fo:FieldObject):
	applying = false
	_enter_waiting_mode(fo)


func _on_draw(field:GameField):
	if applying:
		_draw_on_applying(field)
	else:
		_draw_on_waiting(field)


func get_ability_name():
	return _name()


# virtual
func _enter_applying_mode(fo:FieldObject, to:Vector2i):
	pass

# virtual
func _enter_waiting_mode(fo:FieldObject):
	pass
	

# virtual
func _draw_on_applying(field:GameField):
	pass

# virtual
func _draw_on_waiting(field:GameField):
	pass


# virtual
func _name():
	return ""
