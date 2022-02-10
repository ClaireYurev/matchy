extends Node2D

# The only thing this needs to keep track of is how much help it has
export (int) var health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_damage(damage):
	health -= damage
	# Can add damage effect here (particle system, or explosion effect)
