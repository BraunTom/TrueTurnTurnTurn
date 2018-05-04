extends KinematicBody2D

export (int) var SPEED
export (float) var gravityConst
export (float) var jumpStrength
var velocity = Vector2()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	velocity = Vector2( )
	pass

func _process(delta):
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity = jump(velocity)
    if velocity.length() > 0:
        $AnimatedSprite.play()
    else:
        $AnimatedSprite.stop()
    velocity = applyGravity(velocity)
    move_and_collide(velocity)

func applyGravity(vector):
	vector.y -= gravityConst
	return vector

func jump(vector):
	vector.y = jumpStrength
	return vector