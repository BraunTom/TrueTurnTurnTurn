extends Sprite
const LightClass = preload("res://Light.gd")

const whiteTexture = preload("res://Blocks/block white.png")
const redTexture = preload("res://Blocks/block red.png")
const orangeTexture = preload("res://Blocks/block orange.png")
const yellowTexture = preload("res://Blocks/block yellow.png")
const blueTexture = preload("res://Blocks/block blue.png")
const greenTexture = preload("res://Blocks/block green.png")
const goalTexture = preload("res://Blocks/block green.png")

const textureMap = {
	LightClass.Colors.WHITE : whiteTexture,
	LightClass.Colors.RED : redTexture,
	LightClass.Colors.ORANGE : orangeTexture,
	LightClass.Colors.YELLOW : yellowTexture,
	LightClass.Colors.BLUE : blueTexture,
	LightClass.Colors.GREEN : greenTexture,
	LightClass.Colors.END : goalTexture,
}

func getTexture(color):
	return textureMap[color]