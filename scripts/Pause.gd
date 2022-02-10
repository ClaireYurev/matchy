extends "res://scripts/BaseMenuPanel.gd"

func _on_Continue_pressed():
	get_tree().paused = false
	slide_out()

func _on_Quit_pressed():
	# Y.Y.: USED TO BE:
	get_tree().change_scene("res://scenes/GameMenu.tscn")
	get_tree().paused = false

func _on_bottom_ui_pause_game():
	slide_in()
