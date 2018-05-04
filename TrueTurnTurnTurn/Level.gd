extends Node2D

signal LIGHT_CHANGED(color)

func notifyLightChange(color):
	emit_signal("LIGHT_CHANGED",color)
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	connect("LIGHT_CHANGED", self, "colorChanged")
	
func colorChanged(newColor):
	print("Level Got signal")

func respawnPlayer():
	#replace_by(preload("res://level1/Node2D.tscn").instance())
	get_tree().reload_current_scene()