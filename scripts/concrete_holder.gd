extends Node2D

signal remove_concrete

# Board values
var concrete_pieces = []
var width = 8
var height = 10
var concrete = preload("res://scenes/concrete.tscn")

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

func _on_grid_make_concrete(board_position):
	if concrete_pieces.size() == 0:
		concrete_pieces = make_2d_array()
	var current = concrete.instance()
	add_child(current)
	current.position = Vector2(board_position.x * 64 + 64, -board_position.y * 64 + 864)
	# Now, to make sure that it is correctly seeded in the array:
	concrete_pieces[board_position.x][board_position.y] = current
	pass # Replace with function body.

func _on_grid_damage_concrete(board_position):
	if concrete_pieces.size() != 0:
		if concrete_pieces[board_position.x][board_position.y]:
			concrete_pieces[board_position.x][board_position.y].take_damage(1)
			if concrete_pieces[board_position.x][board_position.y].health <= 0:
				concrete_pieces[board_position.x][board_position.y].queue_free()
				concrete_pieces[board_position.x][board_position.y] = null
				emit_signal("remove_concrete", board_position)
