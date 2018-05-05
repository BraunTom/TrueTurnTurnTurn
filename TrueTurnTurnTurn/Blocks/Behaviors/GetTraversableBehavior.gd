extends "res://Blocks/Behaviors/BlockBehavior.gd"
const Player = preload("res://Player.gd")

var occluder
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

		
func setActive(isActive):
	.setActive(isActive)
	var mask = 2 if isActive else 1
	block.set_collision_layer(mask)
	block.set_collision_mask(mask)
	mask = mask * mask * mask
	block.get_node("LightOccluder2D").set_occluder_light_mask(mask)