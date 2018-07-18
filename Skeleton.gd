extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(String) var anim = "Idle"

var status = "play"

func set_anim(animation):
	if $Skeleton.current_animation != animation and status == "play":
		$Skeleton.current_animation = animation
		
func play():
	if status != "play":
		$Skeleton.play()
		status = "play"
	pass
func stop():
	if status != "stop":
		$Skeleton.stop()
		status = "stop"
	pass

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Skeleton.current_animation = anim
	pass
