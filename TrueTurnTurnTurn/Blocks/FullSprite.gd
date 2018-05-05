extends Sprite
const LightClass = preload("res://Light.gd")

const whiteTexture = preload("res://Blocks/block white.png")
const redTexture = preload("res://Blocks/block red.png")
const greenTexture = preload("res://Blocks/block green.png")
const orangeTexture = preload("res://Blocks/block orange.png")

const textureMap = {
	LightClass.Colors.WHITE : whiteTexture,
	LightClass.Colors.RED : redTexture,
	LightClass.Colors.GREEN : greenTexture,
	LightClass.Colors.ORANGE : orangeTexture
}

func getTexture(color):
	return textureMap[color]