extends Sprite
const LightClass = preload("res://Light.gd")

const whiteTexture = preload("res://Blocks/halfblock_white.png")
const redTexture = preload("res://Blocks/halfblock_red.png")
const greenTexture = preload("res://Blocks/halfblock_green.png")
const orangeTexture = preload("res://Blocks/halfblock_orange.png")

const textureMap = {
	LightClass.Colors.WHITE : whiteTexture,
	LightClass.Colors.RED : redTexture,
	LightClass.Colors.GREEN : greenTexture,
	LightClass.Colors.ORANGE : orangeTexture
}

func getTexture(color):
	return textureMap[color]