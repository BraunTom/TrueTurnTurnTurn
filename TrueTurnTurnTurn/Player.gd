extends KinematicBody2D

export (float) var gravityConst = -15.3
export (float) var jumpStrength = 500
export (Vector2) var maxSpeed = Vector2(1000, 1000)
var velocity = Vector2()
var controls = ["ui_right", "ui_left"]
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here	
	pass

func _process(delta):
	if Input.is_action_pressed(controls[0]):
		velocity.x += 30
	if Input.is_action_pressed(controls[1]):
		velocity.x -= 30
	if Input.is_action_pressed("ui_up") && is_on_floor():
		print("debug")
		print(jumpStrength)
		velocity = jump(velocity)
	if Input.is_action_pressed("ui_down"):
		rotateControls(controls)
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	velocity = applyGravity(velocity)
	velocity = applyFriction(velocity)
	#move_and_collide(velocity)
	
	velocity = clampToMaxSpeed(velocity)
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if get_slide_count() > 0:
		var collision = get_slide_collision(0)
		
		if collision.collider.has_method("collideWithPlayer"):
			collision.collider.collideWithPlayer(self, collision)
	
	#if is_on_floor():
	#	velocity.y = 0  

func rotateControls(array):
	array.push_front(array.pop_back())

func applyGravity(vector):
	vector.y -= gravityConst
	return vector

func applyFriction(vector):
	vector.x = vector.x * 0.93
	return vector

func jump(vector):
	vector.y = -jumpStrength
	return vector

func clampToMaxSpeed(vector):
	vector.x = clamp(vector.x, -maxSpeed.x, maxSpeed.x)
	vector.y = clamp(vector.y, -maxSpeed.y, maxSpeed.y)
	return vector