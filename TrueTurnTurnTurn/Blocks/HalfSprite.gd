extends Sprite
const LightClass = preload("res://Light.gd")

const whiteTexture = preload("res://Blocks/halfblock_white.png")
const redTexture = preload("res://Blocks/halfblock_red.png")
const orangeTexture = preload("res://Blocks/halfblock_orange.png")
const yellowTexture = preload("res://Blocks/halfblock_yellow.png")
const blueTexture = preload("res://Blocks/halfblock_blue.png")
const greenTexture = preload("res://Blocks/halfblock_green.png")

const textureMap = {
	LightClass.Colors.WHITE : whiteTexture,
	LightClass.Colors.RED : redTexture,
	LightClass.Colors.ORANGE : orangeTexture,
	LightClass.Colors.YELLOW : yellowTexture,
	LightClass.Colors.BLUE : blueTexture,
	LightClass.Colors.GREEN : greenTexture
}

func getTexture(color):
	return textureMap[color]