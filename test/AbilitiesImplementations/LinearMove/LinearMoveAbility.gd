extends Ability

class_name LinearMoveAbility

const NAME = "LinearMoveAbility"

func _get_action(fo:FieldObject, apply_position:Vector2i) -> Action:
	var abil_data : LinearMoveAbilityData = fo.abilities_data[NAME]
	
	if HexPlane.get_diatance(fo.position, apply_position) > abil_data.move_remains:
		return EmptyAction.new()
	
	var res : MoveAction = MoveAction.new(fo, apply_position)
	
	var anim_action : Action = null
	if fo.visual_node != null:
		anim_action = fo.visual_node.get_animate_ability_action(NAME, apply_position)
	
	if anim_action != null:
		res.add_parallel_action(anim_action)
	
	return res
