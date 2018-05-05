extends "res://Blocks/Behaviors/BlockBehavior.gd"
const Player = preload("res://Player.gd")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func collideWithPlayer(collider, collision):
	if(not block.isActive()):
		return
	elif (not collider is Player):
		return
	else:
		block.set_collision_layer(2)
		block.set_collision_mask(2)
		print(block.get_tree())
		block.get_tree().change_scene('res://level2/level2.tscn')