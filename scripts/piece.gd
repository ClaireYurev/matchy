extends Node2D

export (String) var color
export (Texture) var row_texture
export (Texture) var column_texture
export (Texture) var adjacent_texture
export (Texture) var color_bomb_texture

var is_row_bomb = false
var is_column_bomb = false
var is_adjacent_bomb = false
var is_color_bomb = false

var move_tween
var matched = false

func move(target):
	move_tween.interpolate_property(self, "position", position, target, .5,
								   Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	move_tween.start()
	pass

func make_column_bomb():
	is_column_bomb = true
	$Sprite.texture = column_texture # Access the sprite via $ operator because it's a child of the main node 
	$Sprite.modulate = Color(1, 1, 1, 1) # Because we are going to be making a column bomb out of something that was already DIMed
										  # we are going to access the modulate property and change its color to full Alpha
func make_row_bomb():
	is_row_bomb = true
	$Sprite.texture = row_texture 
	$Sprite.modulate = Color(1, 1, 1, 1)

func make_adjacent_bomb():
	is_adjacent_bomb = true
	$Sprite.texture = adjacent_texture
	$Sprite.modulate = Color(1, 1, 1, 1)

# Called when the node enters the scene tree for the first time.
func _ready():
	move_tween = get_node("move_tween");
	# also can be done via move_tween = $move_tween assuming there is no spaces in name

func make_color_bomb():
	is_color_bomb = true
	$Sprite.texture = color_bomb_texture
	$Sprite.modulate = Color(1, 1, 1, 1)
	color = "Color"

func dim():
	var sprite = get_node("Sprite")
	sprite.modulate = Color(1, 1, 1, .5);
