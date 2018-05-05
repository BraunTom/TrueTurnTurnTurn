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
	flipAll()
func flipAll():
	var m = Transform2D()
	m = m.rotated(PI) # rotate 90°
	var m2 = Transform2D( ).scaled(Vector2(-1,1))
	m = m2 * m
	print(m)
	#Physics2DServer.area_set_param(RID(self), Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2(-1,-1))
	
	set_global_transform(get_global_transform() * m)
	

func respawnPlayer():
	#replace_by(preload("res://level1/Node2D.tscn").instance())
	get_tree().reload_current_scene()