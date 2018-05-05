extends "res://Blocks/Behaviors/BlockBehavior.gd"
const Player = preload("res://Player.gd")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func collideWithPlayer(collider, collision):
	if (not collider is Player):
		return
	else:
		block.set_collision_layer(2)
		block.set_collision_mask(2)
		var nextLevelPath = 'res://level{number}/level{number}.tscn'.format({'number': int(block.get_tree().get_current_scene().get_name().split('_')[1]) + 1})
		
		if Directory.new().file_exists(nextLevelPath):
			block.get_tree().change_scene(nextLevelPath)