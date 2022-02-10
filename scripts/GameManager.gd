extends Node

""" 12.3.20
This script is a game manager observer object. It keeps track of the board size,
the current level, current moves or timer, score and high score, points per
piece, goals, and so on.
"""

# Board Variables
export (int) var width
export (int) var height
var board_stable = true

# Level Variables
export (int) var level
export (bool) var is_moves
export (int) var max_counter
var current_counter

# Score Variables
var current_high_score
var current_score
export (int) var max_score
export (int) var points_per_piece

# Signals
signal set_dimensions
signal set_score_info
signal set_counter_info

# Booster Stuff
signal screen_fade_in
signal screen_fade_out
signal grid_change_move
var booster_active = false
var current_booster = ""

# Goal Variables & Signals
onready var goal_holder = $GoalHolder
var game_won = false
var game_lost = false
signal create_goal
signal game_won
signal game_lost

func _ready():
	setup()

func setup():
	if !is_moves:
		$MoveTimer.start()
	current_counter = max_counter
	current_score = 0
	if GameDataManager.level_info.has(level):
		if GameDataManager.level_info[level].has("high score"):
			current_high_score= GameDataManager.level_info[level]["high score"]
	emit_signal("set_score_info", max_score, current_score)
	emit_signal("set_dimensions", width, height)
	emit_signal("set_counter_info", current_counter)
	create_goals()

func change_board_state():
	board_stable = !board_stable
	check_game_win()

func create_goals():
	for i in goal_holder.get_child_count():
		var current = goal_holder.get_child(i)
		emit_signal("create_goal", current.max_needed, current.goal_texture, current.goal_string)

func check_goals(goal_type):
	for i in goal_holder.get_child_count():
		goal_holder.get_child(i).check_goal(goal_type)
	check_game_win()

func check_game_win():
	if goals_met() and board_stable:
		emit_signal("game_won", current_score)
		GameDataManager.level_info[level + 1] = {
			"unlocked": true,
			"high score": 0,
			"stars unlocked": 0
		}
		game_won = true

func goals_met():
	for i in goal_holder.get_child_count():
		if !goal_holder.get_child(i).goal_met:
			return false
	return true

func booster_function():
	if booster_active:
		if current_booster == "Counter Bomb":
			current_counter += 10
			if current_counter > max_counter:
				current_counter = max_counter
			emit_signal("set_counter_info", current_counter)
		elif current_booster == "Color Bomb":  # Below 2 lines TBD
			# We want to emit a signal to tell the board to turn a
			# specific piece into a color bomb.
			# ^^^ The logic for the above is still in the Grid script.
			# Find it & replicate it. Only this time you have to emit
			# a signal with a board position as a Vector 2 to the Grid.
			pass
		elif current_booster == "Destroy Piece Bomb": # Below 2 lines TBD
			# We want to emit a signal to tell the board to destroy a
			# specific piece and then do the refill logic.
			# ^^^ The logic for the above is still in the Grid script.
			# Find it & replicate it. Only this time you have to emit
			# a signal with a board position as a Vector 2 to the Grid.
			pass 
	# After the above, we call the UI function to turn the booster state off
		_on_bottom_ui_booster_pressed(current_booster)
# *** !!! *** NEXT TIME WE ARE GOING TO MAKE THESE CHOOSABLE FROM THE MENU 

		
# Incoming Signals

func update_counter():
	if !booster_active:
		current_counter -= 1
		if current_counter < 0:
			current_counter = 0
			if !game_lost and board_stable: 
				emit_signal("game_lost")
				game_lost = true
				$MoveTimer.one_shot = true
		emit_signal("set_counter_info", current_counter)

func _on_grid_update_score(streak_value):
	current_score += streak_value * points_per_piece
	emit_signal("set_score_info", max_score, current_score)

func _on_grid_update_counter():
	if is_moves:
		update_counter()

func _on_MoveTimer_timeout():
	if !is_moves and !game_won:
		update_counter()

func _on_grid_check_goal(goal_type):
	check_goals(goal_type)

func _on_ice_holder_break_ice(goal_type):
	check_goals(goal_type)

func _on_grid_change_move_state():
	change_board_state()

func _on_bottom_ui_booster_pressed(booster_type):
	if booster_active and board_stable:
		current_booster = ""
		emit_signal("screen_fade_out")
		emit_signal("grid_change_move")
		booster_active = false
	elif !booster_active and board_stable:
		current_booster = booster_type
		emit_signal("screen_fade_in")
		emit_signal("grid_change_move")
		booster_active = true
		print(current_booster)
		
func _on_grid_extra_input(is_valid_input):
	if is_valid_input and booster_active:
		booster_function()
	elif !is_valid_input and booster_active:
		_on_bottom_ui_booster_pressed(current_booster)
