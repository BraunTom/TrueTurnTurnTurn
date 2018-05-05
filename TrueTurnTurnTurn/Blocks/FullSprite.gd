extends Sprite
const LightClass = preload("res://Light.gd")

const whiteTexture = preload("res://Blocks/Assets/block white.png")
const redTexture = preload("res://Blocks/Assets/block red.png")
const orangeTexture = preload("res://Blocks/Assets/block orange.png")
const yellowTexture = preload("res://Blocks/Assets/block yellow.png")
const blueTexture = preload("res://Blocks/Assets/block blue.png")
const greenTexture = preload("res://Blocks/Assets/block green.png")
const goalTexture = preload("res://Blocks/Assets/finish_torte.svg")

const textureMap = {
	LightClass.Colors.WHITE : whiteTexture,
	LightClass.Colors.RED : redTexture,
	LightClass.Colors.ORANGE : orangeTexture,
	LightClass.Colors.YELLOW : yellowTexture,
	LightClass.Colors.BLUE : blueTexture,
	LightClass.Colors.GREEN : greenTexture,
	LightClass.Colors.END : goalTexture
}

func getTexture(color):
	return textureMap[color]