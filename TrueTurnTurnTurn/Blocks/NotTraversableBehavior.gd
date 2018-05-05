extends "res://Blocks/BlockBehavior.gd"
const Player = preload("res://Player.gd")


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

		
func setActive(isActive):
	.setActive(isActive)
	print("Actively")
	var mask = 1 if isActive else 2
	block.set_collision_layer(mask)
	block.set_collision_mask(mask)