extends Node

const LightClass = preload("res://Light.gd")

const whiteTexture = preload("res://Globuli/globuli_green.svg")
const redTexture = preload("res://Globuli/globuli_red.png")
const greenTexture = preload("res://Globuli/globuli_green.svg")
const orangeTexture = preload("res://Globuli/globuli_orange.png")

const textureMap = {
	LightClass.Colors.WHITE : whiteTexture,
	LightClass.Colors.RED : redTexture,
	LightClass.Colors.GREEN : greenTexture,
	LightClass.Colors.ORANGE : orangeTexture
}

func getTexture(color):
	return textureMap[color]