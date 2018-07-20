extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(String) var anim = "Idle"

var status = "play"
var timer = 0

func set_anim(animation):
	anim = animation
	if $Skeleton.current_animation != animation and status == "play":
		$Skeleton.current_animation = animation
		
func play():
	if status != "play":
		if $Skeleton.current_animation != anim:
			timer = 0
		$Skeleton.seek(timer, true)
		$Skeleton.play(anim)
		print(timer)
		$Skeleton.seek(timer, true)
		status = "play"
	pass
func stop():
	if status != "stop":
		timer = $Skeleton.current_animation_position
		print(timer)
		$Skeleton.stop()
		status = "stop"
	pass

func toggle():
	if status == "stop":
		play()
	else:
		stop()


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Skeleton.current_animation = anim
	pass
