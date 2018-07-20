extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Skeleton.set_anim("String_Walk")
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	if Input.is_action_just_pressed("ui_accept"):
		$Skeleton.toggle()
		#print("bananas")
