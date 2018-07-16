extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(String) var anim = "Walk"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Skeleton.current_animation = anim
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
