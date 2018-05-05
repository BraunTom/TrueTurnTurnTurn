extends StaticBody2D
const LightClass = preload("res://Light.gd")


const emptyBehavior = preload("res://Blocks/BlockBehavior.gd")
const bounceBehavior = preload("res://Blocks/BounceBehavior.gd")
const killBehavior = preload("res://Blocks/killBehavior.gd")

const behaviorMap = {
	LightClass.Colors.WHITE : emptyBehavior,
	LightClass.Colors.RED : killBehavior,
	LightClass.Colors.GREEN : emptyBehavior,
	LightClass.Colors.ORANGE : bounceBehavior
}

export var active = true setget setActive, isActive
export var color = LightClass.Colors.WHITE setget setColor, getColor
export var behavior = behaviorMap[LightClass.Colors.WHITE]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_parent().get_parent().connect("LIGHT_CHANGED", self, "colorChanged")
	updateTexture()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func collideWithPlayer(collider, collision):
	behavior.collideWithPlayer(self, collider, collision)
	
	
func setActive(isActive):
	active = isActive
func isActive():
	return active
	
func setColor(newColor):
	color = newColor
	updateTexture()
	updateBehavior()

func getColor():
	return color
	
func colorChanged(newColor):
	setColor(newColor)# TODO remove this!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	setActive(color == newColor)

func updateTexture():
	if(get_node("Sprite") != null):
		get_node("Sprite").set_texture(getTexture(color))
		
func getTexture(color):
	if(get_node("Sprite") != null):
		return get_node("Sprite").getTexture(color)
		
func updateBehavior():
	behavior = behaviorMap[color]
	