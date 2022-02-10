extends Node2D

# Board values
var ice_pieces = []
var width = 8
var height = 10
var ice = preload("res://scenes/ice.tscn")

# Goal Signal Stuff
signal break_ice
export (String) var value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func make_2d_array():
	var array = []; # this is a temporary variable
	for i in width:
		array.append([]); #Take the array and append to every spot on the array another entire new array
		for j in height:
			array[i].append(null); #this creates a blank two-dimensional array
	return array;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_grid_make_ice(board_position):
	if ice_pieces.size() == 0:
		ice_pieces = make_2d_array()
	var current = ice.instance()
	add_child(current)
	current.position = Vector2(board_position.x * 64 + 64, -board_position.y * 64 + 864)
	# Now, to make sure that it is correctly seeded in the array:
	ice_pieces[board_position.x][board_position.y] = current
	pass # Replace with function body.

func _on_grid_damage_ice(board_position):
	if ice_pieces.size() != 0:
		if ice_pieces[board_position.x][board_position.y]:
			ice_pieces[board_position.x][board_position.y].take_damage(1)
			if ice_pieces[board_position.x][board_position.y].health <= 0:
				ice_pieces[board_position.x][board_position.y].queue_free()
				ice_pieces[board_position.x][board_position.y] = null
				emit_signal("break_ice", value)
