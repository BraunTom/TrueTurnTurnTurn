extends StaticBody2D
const LightClass = preload("res://Light.gd")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var active = true setget setActive, isActive
export var color = LightClass.Colors.WHITE

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_parent().get_parent().connect("LIGHT_CHANGED", self, "colorChanged")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func collideWithPlayer(collider, collision):
	pass
	
	
func setActive(isActive):
	active = isActive
func isActive():
	return active
	
func colorChanged(newColor):
	print("Got signal")
	setActive(color == newColor)