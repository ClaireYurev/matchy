extends Node2D

"""12.3.20
This manages the parallax background.
Direction of motion is Right-to-Left, hence the 'Left Limit'.
> _process(delta) is REQUIRED
"""

export (int) var speed    # Defines Speed - Can be set independent on each Node
export (int) var left_limit    # Defines Left Limit - Can be set independent on each Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	# Take our current position.x and add to it: speed xTIMESx delta, where:
	# delta is the amount of time that has passed between this frame and 
	# the frame that came before. That way, it will appear to move at the
	# same speed no matter what the frame rate of your device is.
	# All of this can be done for Up and Down as well.
	position.x += speed * delta
	if position.x <= left_limit:
		# If the above, then we will reset the position.x equal to zero
		position.x = 0
