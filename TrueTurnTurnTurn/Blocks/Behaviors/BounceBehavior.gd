extends "res://Blocks/Behaviors/BlockBehavior.gd"
const Player = preload("res://Player.gd")


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
var directionOfVelocity = Vector2(1,1)

func collideWithPlayer(collider, collision):
	if(not block.isActive()):
		return
	elif (not collider is Player):
		return
	else:
		var dir = (collision.normal)
		print(dir)
		collider.velocity = collider.velocity + (dir * 1000)
		
func flipSpeed(vector):
	directionOfVelocity = vector

func applyFlip(vector):
	vector.x = vector.x * directionOfVelocity.x
	vector.y = vector.y * directionOfVelocity.y
	return vector