extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

static func collideWithPlayer(block, collider, collision):
	if(not block.isActive()):
		return
	elif (not collider is Player):
		return
	else:
		collider.enterGoal()