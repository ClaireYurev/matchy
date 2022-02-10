extends Camera2D

# We need to reference the ScreenKick tween node here, and it needs to be an
# variable, so that the script doesn't wait for that asset to load
onready var screen_kick = $ScreenKick

func _ready():
	pass # Replace with function body.

func camera_effect_1():
	# The property we are changing is 'zoom'. Hover over it in inspector
	# We're gonna have it JUMP IN and then slowly move BACK OUT
	screen_kick.interpolate_property(self, "zoom", Vector2(0.9, 0.9), Vector2(1, 1), 0.2, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	screen_kick.start()
	# We send a signal to the camera to tell it to do the above within the Grid
	# script, by making another camera signal (shake_camera)

# The following method will move the camera to where it's supposed to be
# We are going to call this from our signal. The property of Camera2D that we
# are modifying is "offset"
func move_camera(placement):
	offset = placement
	# we are also going to call this function from the Grid script's ready function

func _on_grid_place_camera(placement):
	move_camera(placement)

func _on_grid_shake_camera():
	camera_effect_1()
