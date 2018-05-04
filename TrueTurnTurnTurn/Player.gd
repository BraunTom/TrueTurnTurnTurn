extends KinematicBody2D

export (float) var gravityConst
export (float) var jumpStrength
export (Vector2) var maxSpeed
var velocity = Vector2()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	velocity = Vector2( )
	gravityConst = -15.3
	jumpStrength = 500
	maxSpeed = Vector2(1000, 1000)
	pass

func _process(delta):
    if Input.is_action_pressed("ui_right"):
        velocity.x += 30
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 30
    if Input.is_action_pressed("ui_down"):
        velocity.y += 30
    if Input.is_action_pressed("ui_up") && is_on_floor():
        velocity = jump(velocity)
    if velocity.length() > 0:
        $AnimatedSprite.play()
    else:
        $AnimatedSprite.stop()
    velocity = applyGravity(velocity)
    velocity = applyFriction(velocity)
    #move_and_collide(velocity)
    velocity = clampToMaxSpeed(velocity)
    move_and_slide(velocity, Vector2(0, -1))
    if is_on_floor():
       print("jump ready")

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