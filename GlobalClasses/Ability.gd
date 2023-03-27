extends RefCounted

class_name Ability


signal ability_started
signal ability_completed


func get_apply_action(fo:FieldObject, to:Vector2i) -> Action:
	var result : Action = _get_action(fo, to)
	
	if result == null or result is EmptyAction:
		return null
	
	return ActionPack.new([
		EmitSignalAction.new(ability_started),
		result,
		EmitSignalAction.new(ability_completed)
	])


# virtual
func _get_action(fo:FieldObject, to:Vector2i) -> Action:
	return EmptyAction.new()
