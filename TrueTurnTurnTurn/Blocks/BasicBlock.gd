extends StaticBody2D
const LightClass = preload("res://Light.gd")


const emptyBehavior = preload("res://Blocks/Behaviors/BlockBehavior.gd")
const bounceBehavior = preload("res://Blocks/Behaviors/BounceBehavior.gd")
const killBehavior = preload("res://Blocks/Behaviors/KillBehavior.gd")
const getTraversBehavior = preload("res://Blocks/Behaviors/GetTraversableBehavior.gd")
const notTraversBehavior = preload("res://Blocks/Behaviors/NotTraversableBehavior.gd")
const goalBehavior = preload("res://Blocks/Behaviors/GoalBehavior.gd")

const behaviorMap = {
	LightClass.Colors.WHITE : emptyBehavior,
	LightClass.Colors.RED : killBehavior,
	LightClass.Colors.ORANGE : bounceBehavior,
	LightClass.Colors.YELLOW : emptyBehavior,
	LightClass.Colors.BLUE : getTraversBehavior,
	LightClass.Colors.GREEN : notTraversBehavior,
	LightClass.Colors.END : goalBehavior
}

export var active = true setget setActive, isActive
export var color = LightClass.Colors.WHITE setget setColor, getColor
var behavior = createBehavior(behaviorMap[color])

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("/root").get_child(0).connect("LIGHT_CHANGED", self, "colorChanged")
	updateTexture()
	updateBehavior()
	self.active = active

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func collideWithPlayer(collider, collision):
	behavior.collideWithPlayer(collider, collision)
	
	
func setActive(isActive):
	behavior.setActive(isActive)
func isActive():
	return (behavior == null) || behavior.isActive()
	
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
	behavior = createBehavior(behaviorMap[color])
	
func createBehavior(behaviorClass):
	var newBehavior = behaviorClass.new()
	newBehavior.init(self,true)
	return newBehavior
	