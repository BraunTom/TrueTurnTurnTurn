extends StaticBody2D
const LightClass = preload("res://Light.gd")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var color = LightClass.Colors.WHITE setget setColor, getColor

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	updateTexture()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func getCollectedFrom(player):
	player.collectedGloboli(color)
	queue_free()
	
func setColor(newColor):
	color = newColor
	updateTexture()
	
func getColor():
	return color
	
func updateTexture():
	if(get_node("Sprite") != null):
		get_node("Sprite").set_texture(getTexture(color))

func getTexture(color):
	if(get_node("Sprite") != null):
		return get_node("Sprite").getTexture(color)
