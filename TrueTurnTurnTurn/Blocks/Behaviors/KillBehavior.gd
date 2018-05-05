extends "res://Blocks/Behaviors/BlockBehavior.gd"
const Player = preload("res://Player.gd")


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func collideWithPlayer(collider, collision):
	if(block.isActive()):
		return
	elif (not collider is Player):
		return
	else:
		collider.die()