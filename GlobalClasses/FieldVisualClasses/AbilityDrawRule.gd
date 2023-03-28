extends FieldDrawRule

class_name AbilityDrawRule


var applying : bool = false


func draw_applying():
	applying = true


func draw_waiting():
	applying = false


func _on_draw(field:GameField):
	if applying:
		_draw_on_applying(field)
	else:
		_draw_on_waiting(field)


func start():
	_on_start()


func update():
	_on_update()


func get_ability_name():
	return _name()


func _draw_on_applying(field:GameField):
	pass


func _draw_on_waiting(field:GameField):
	pass

# virtual
func _on_update():
	pass

# virtual
func _on_start():
	pass

# virtual
func _name():
	return ""
