extends FieldDrawRule

class_name AbilityDrawRule


func start():
	_on_start()


func update():
	_on_update()


func get_ability_name():
	return _name()


# virtual
func _on_update():
	pass

# virtual
func _on_start():
	pass

# virtual
func _name():
	return ""
