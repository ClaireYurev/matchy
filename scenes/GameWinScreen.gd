extends "res://scripts/BaseMenuPanel.gd"

var is_out = false

onready var score_label = $MarginContainer/TextureRect/VBoxContainer/ScoreLabel

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://scenes/LevelSelectScene.tscn")

func _on_GameManager_game_won(score_to_display):
	score_label.text = String(score_to_display)
	if is_out == false:
		is_out = true
		slide_in()
