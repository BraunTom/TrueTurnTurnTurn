extends "res://Blocks/BasicBlock.gd"
const Player = preload("../player.gd")


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func collideWithPlayer(collider, collision):
	if (not collider is Player):
		return
	else:
		