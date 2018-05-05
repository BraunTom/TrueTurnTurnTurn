extends "res://Blocks/Behaviors/BlockBehavior.gd"
const Player = preload("res://Player.gd")


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

		
func setActive(isActive):
	.setActive(isActive)
	var mask = 1 if isActive else 2
	block.set_collision_layer(mask)
	block.set_collision_mask(mask)
	mask = mask * mask * mask
	block.get_node("LightOccluder2D").set_occluder_light_mask(mask)
	# block.get_node("Sprite").remove_child(block.get_node("Sprite").get_node("LightOccluder2D"))
	