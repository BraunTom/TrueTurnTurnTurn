extends "res://Blocks/BlockBehavior.gd"
const Player = preload("res://Player.gd")


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

static func collideWithPlayer(block, collider, collision):
	if(not block.isActive()):
		return
	elif (not collider is Player):
		return
	else:
		var dir = -collision.travel.reflect(collision.normal)
		collider.velocity += dir * 100