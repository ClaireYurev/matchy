extends HBoxContainer

""" 12.3.20
This script manages the booster buttons.
It reads the booster types for the level from the BoosterInfo script and sets
the buttons to have a corresponding texture to their type, or no texture if
the button does not have a type.
> The _process function is not required.
"""

func _ready():
	#BoosterInfo.booster_vault[1] = "Color Bomb"
	BoosterInfo.booster_vault[1] = "Counter Bomb"
	activate_booster_buttons()

func activate_booster_buttons():
	for i in range(1, get_child_count()):
		if get_child(i).is_in_group("Boosters"):
			if BoosterInfo.booster_vault[i] == "":
				get_child(i).check_active(false, null)
			else:
				get_child(i).check_active(true, BoosterInfo.booster_vault[i])
