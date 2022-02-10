extends Node

# This is a custom Node - because you only have 1 script per Node
# Equivalent of Custom Class in C# that you would need to serialize

# Goal information & reference

export (Texture) var goal_texture  # Texture that will be used to communicate the information to the UI by reflecting it with the texture
export (int) var max_needed # Max number
export (String) var goal_string # A string value that defines which piece is which
var number_collected = 0
var goal_met = false

# Checks to see if the goal that we're receiving incormation about is compatible with this particular goal
func check_goal(goal_type):
	if goal_type == goal_string:
		update_goal()

# A helper function to increase the number of current goals that we have and realize when we collect all of that goal which we need
func update_goal():
	if number_collected < max_needed:
		number_collected += 1;
	if number_collected == max_needed:
		if !goal_met: # "If goal_met is already false"
			goal_met = true
