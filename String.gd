extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	#var glob_rot = get_global_transform().get_rotation()
	#rotation = rotation + glob_rot - PI
	global_rotation = 0
	global_scale = Vector2(1,-900)