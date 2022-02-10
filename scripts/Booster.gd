extends TextureButton

""" 12.3.20
This script holds information about boosters.
Right now the only boosters are: Color Bomb, Adding to the Counter Bomb,
and Destroy a Piece Bomb
> Neither the _ready nor the _process functions are required.
"""

enum {add_to_counter, make_color_bomb, destroy_piece}
var state

var active = false

# Texture Stuff
var active_texture
var type = ""
export (Texture) var color_bomb_texture
export (Texture) var add_counter_bomb_texture
export (Texture) var destroy_piece_bomb_texture

func check_active(is_active, booster_type):
	if is_active:
		if booster_type == "Color Bomb":
			texture_normal = color_bomb_texture
			type = "Color Bomb"
		elif booster_type == "Counter Bomb":
			texture_normal = add_counter_bomb_texture
			type = "Counter Bomb"
		elif booster_type == "Destroy Piece Bomb":
			texture_normal = destroy_piece_bomb_texture
			type = "Destroy Piece Bomb"
	else:
		texture_normal = null
		type = ""

