extends RefCounted

class_name Ability


class DefferedApplyingAction:
	extends Action
	
	var ability : Ability
	var actor : FieldObject
	var target : Vector2i
	
	
	func _init(abil:Ability, fo:FieldObject, to:Vector2i):
		ability = abil
		actor = fo
		target = to
	
	
	func _on_start():
		var result : Action = ability.get_apply_action(actor, target)
		
		if result != null:
			next_actions.append(result)
		
		completed = true
	
	
	func _to_string():
		return "Ability.DefferedApplyingAction: {0} for {1} at {2}".format([
			ability.NAME if "NAME" in ability else "UnnamedAbility",
			actor.name,
			str(target)
		])


signal ability_started(fo:FieldObject, target:Vector2i)
signal ability_completed

var auto : bool = false

func get_deferred_applying_action(fo:FieldObject, to:Vector2i) -> Action:
	return DefferedApplyingAction.new(self, fo, to)


func get_apply_action(fo:FieldObject, to:Vector2i) -> Action:
	var result : Action = _get_action(fo, to)
	
	if result == null or result is EmptyAction:
		return EmptyAction.new()
	
	return ActionPack.new([
		EmitSignalAction.new(ability_started, [fo, to]),
		result,
		EmitSignalAction.new(ability_completed)
	])



# virtual
func _get_action(fo:FieldObject, to:Vector2i) -> Action:
	return EmptyAction.new()
