extends Button
const LightClass = preload("res://Light.gd")

func pressed():
	get_parent().notifyLightChange(LightClass.Colors.BLUE)