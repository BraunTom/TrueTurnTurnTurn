extends KinematicBody2D

const LightClass = preload("res://Light.gd")

const whiteTexture = preload("res://player/player/player white.png")
const redTexture = preload("res://player/player/player red.png")
const orangeTexture = preload("res://player/player/player orange.png")
const yellowTexture = preload("res://player/player/player yellow.png")
const blueTexture = preload("res://player/player/player blue.png")
const greenTexture = preload("res://player/player/player green.png")
const goalTexture = whiteTexture

const textureMap = {
	LightClass.Colors.WHITE : whiteTexture,
	LightClass.Colors.RED : redTexture,
	LightClass.Colors.ORANGE : orangeTexture,
	LightClass.Colors.YELLOW : yellowTexture,
	LightClass.Colors.BLUE : blueTexture,
	LightClass.Colors.GREEN : greenTexture,
	LightClass.Colors.END : goalTexture
}

var gravityConst = -20
var jumpStrength = 450
var maxSpeed = Vector2(1000, 1000)
var velocity = Vector2()
var directionOfVelocity = Vector2(1,1)
var controls = ["ui_right", "ui_left"]

var color = LightClass.Colors.WHITE

func _ready():
	var frames = get_node('AnimatedSprite').get_sprite_frames()
	frames.clear_all()
	for c in textureMap:
		frames.add_animation(str(c))
		frames.add_frame(str(c), textureMap[c])
	get_node("/root").get_child(0).connect("LIGHT_CHANGED", self, "colorChanged")
	colorChanged(color)
	pass


func _process(delta):
	if Input.is_action_pressed(controls[0]):
		velocity.x += 30
		get_node('AnimatedSprite').set_flip_h(true)
	if Input.is_action_pressed(controls[1]):
		velocity.x -= 30
		get_node('AnimatedSprite').set_flip_h(false)
	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity = jump(velocity)
	if Input.is_key_pressed(KEY_R):
		die()
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	velocity = applyGravity(velocity)
	velocity = applyFriction(velocity)
	#move_and_collide(velocity)
	
	velocity = clampToMaxSpeed(velocity)
	velocity = applyFlip(move_and_slide(applyFlip(velocity), applyFlip(Vector2(0, -1))))
	
	
		
	if get_slide_count() > 0:
		var collision = get_slide_collision(0)
		
		if collision.collider.has_method("collideWithPlayer"):
			collision.collider.collideWithPlayer(self, collision)
		
		for i in range(get_slide_count()):
			collision = get_slide_collision(i)
			if collision.collider.has_method("getCollectedFrom"):
				collision.collider.getCollectedFrom(self)
	
	#if is_on_floor():
	#	velocity.y = 0  

func die():
	#status = 0
	get_owner().respawnPlayer()

func flipSpeed(vector):
	directionOfVelocity = vector

func rotateControls(array):
	array.push_front(array.pop_back())

func applyFlip(vector):
	vector.x = vector.x * directionOfVelocity.x
	vector.y = vector.y * directionOfVelocity.y
	return vector
	
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
	
func collectedGloboli(newColor):
	var lightPowerArray = [1.0, 1.2, 1.5, 1.1, 1.5, 1.2]
	color = newColor
	
	get_parent().notifyLightChange(newColor)
	$Light2D.color = LightClass.get_light_color(newColor)
	$Light2D.energy = lightPowerArray[newColor]

func colorChanged(color):
	print("Update")
	get_node("AnimatedSprite").play(str(color))

func getTexture(color):
		return textureMap[color]
		
