extends Node2D

signal LIGHT_CHANGED(color)

func notifyLightChange(color):
	emit_signal("LIGHT_CHANGED",color)
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

	
func flipAll():
	var m = Transform2D()
	m = m.rotated(PI)
	var m2 = Transform2D( ).scaled(Vector2(-1,1))
	m = m2 * m
	set_global_transform(get_global_transform() * m)
	flipGravity(self)
	

func flipGravity(node):
	for N in node.get_children():
		if N.get_child_count() > 0:
			if(N.has_method("flipSpeed")):
				N.directionOfVelocity.y = N.directionOfVelocity.y * -1
			flipGravity(N)
		else:
			# Do something
			if(N.has_method("flipSpeed")):
				N.directionOfVelocity.y = N.directionOfVelocity.y * -1

func respawnPlayer():
	#replace_by(preload("res://level1/Node2D.tscn").instance())
	get_tree().reload_current_scene()