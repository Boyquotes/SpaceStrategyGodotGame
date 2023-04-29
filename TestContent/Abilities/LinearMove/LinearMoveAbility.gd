extends Ability

class_name LinearMoveAbility

const NAME = "LinearMoveAbility"


class DeductMoveRemains:
	extends Action
	
	var _ability_data : LinearMoveAbilityData
	var _deduct_value : int
	
	func _init(data:LinearMoveAbilityData, how_many:int):
		_ability_data = data
		_deduct_value = how_many
	
	
	func _on_start():
		_ability_data.move_remains -= _deduct_value
		completed = true
	
	
	func _to_string():
		return "DeductMoveRemains action: %s"%_deduct_value



func _get_action(fo:FieldObject, apply_position:Vector2i) -> Action:
	var abil_data : LinearMoveAbilityData = fo.abilities_data[NAME]
	
	var move_distance : int = HexPlane.get_diatance(fo.position, apply_position)
	
	if move_distance > abil_data.move_remains:
		return EmptyAction.new()
	
	var res : MoveAction = MoveAction.new(fo, apply_position)
	
	var anim_action : Action = null
	if fo.visual_node != null:
		anim_action = fo.visual_node.get_animate_ability_action(NAME, apply_position)
	
	if anim_action != null:
		res.add_parallel_action(anim_action)
	
	res.add_parallel_action(
		DeductMoveRemains.new(abil_data, move_distance)
	)
	
	return res
