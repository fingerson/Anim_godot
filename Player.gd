extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const UP = Vector2(0,-1)

export (int) var GRAVITY = 1000 # pixels/second²
export (float) var JUMPSPEED = 400 # pixels/second
export (int) var ACCELERATION = 3000 # pixels/second²
export (int) var MAXSPEED = 50 # pixels/second

var velocity
var screensize

var normalMax

signal morreu (violencia)

func _ready():
	
	screensize = get_viewport_rect().size
	velocity = Vector2(0,0)


func _process(delta):
	velocity.y += GRAVITY*delta
	var friction
	
	if is_on_wall():
		velocity.x = 0
		
	if Input.is_action_pressed("ui_right"):
		friction = 0
		velocity.x += ACCELERATION*delta
		if velocity.x > MAXSPEED:
			velocity.x = MAXSPEED
	elif Input.is_action_pressed("ui_left"):
		friction = 0
		velocity.x -= ACCELERATION*delta
		if velocity.x < -MAXSPEED:
			velocity.x = -MAXSPEED
	else:
		friction = 1
		#velocity.x = 0
	#print (prevy)
	if is_on_floor():
		$Skeleton.play()
		velocity.x += friction*-1*velocity.x
		velocity.y = 15
		if Input.is_action_just_pressed("ui_up"):
			$Skeleton.stop()
			velocity.y = -JUMPSPEED
	
	#else:
		#$Skeleton.stop()
	
	move_and_slide(velocity, UP)
	if velocity.x > 0:
		$Skeleton.scale.x = 1
		$Skeleton.set_anim("String_Walk")
	elif velocity.x < 0:
		$Skeleton.scale.x = -1
		$Skeleton.set_anim("String_Walk")
	else:
		$Skeleton.set_anim("Idle")
	#position.x = clamp(position.x, 0, screensize.x)
	#position.y = clamp(position.y, 0, screensize.y*2)

func reset():
	#print("bananas")
	emit_signal("morreu",false)

func hit_by_enemy(enemy):
	reset()
	
func fell():
	reset()
