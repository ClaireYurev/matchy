extends "res://scripts/BaseMenuPanel.gd"

func _on_QuitButton_pressed():
	get_tree().change_scene("res://scenes/GameMenu.tscn")

func _on_RestartButton_pressed():
	get_tree().reload_current_scene()

func _on_GameManager_game_lost():
	slide_in()
