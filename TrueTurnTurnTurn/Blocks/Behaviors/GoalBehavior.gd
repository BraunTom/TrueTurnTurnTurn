extends "res://Blocks/BlockBehavior.gd"
const Player = preload("res://Player.gd")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

static func collideWithPlayer(collider, collision):
	if(not block.isActive()):
		return
	elif (not collider is Player):
		return
	else:
		print('next scene')
		#get_tree().change_scene('res://level2/level2.tscn')