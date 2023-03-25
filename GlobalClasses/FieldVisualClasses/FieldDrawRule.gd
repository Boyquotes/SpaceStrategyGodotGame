extends Node

class_name FieldDrawRule

@export
var enabled : bool = true


func draw_on(field:GameField):
	if enabled:
		_on_draw(field)


# virtual
func _on_draw(field:GameField):
	pass
