extends Node

const LightClass = preload("res://Light.gd")

const whiteTexture = preload("res://Globuli/globuli_green.svg")
const redTexture = preload("res://Globuli/globuli_red.png")
const greenTexture = preload("res://Globuli/globuli_green.svg")
const orangeTexture = preload("res://Globuli/globuli_orange.png")
const yellowTexture = preload("res://Globuli/globuli_yellow.png")
const blueTexture = preload("res://Globuli/globuli_blue.png")

const textureMap = {
	LightClass.Colors.WHITE : whiteTexture,
	LightClass.Colors.ORANGE : orangeTexture,
	LightClass.Colors.RED : redTexture,
	LightClass.Colors.YELLOW : yellowTexture,
	LightClass.Colors.BLUE : blueTexture,
	LightClass.Colors.GREEN : greenTexture
}

func getTexture(color):
	return textureMap[color]