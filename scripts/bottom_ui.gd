extends TextureRect

signal pause_game
signal booster_pressed

func _on_Pause_pressed():
	emit_signal("pause_game")
	get_tree().paused = true
	# Order for the above is important. You need to emit the signal FIRST,
	# and then pause everything. If you were to pause everything FIRST,
	# it would pause ITSELF - and would not be able to emit that signal.

func _on_Booster1_pressed():
	emit_signal("booster_pressed", $MarginContainer/HBoxContainer/Booster1.type)
# OLD FORM:
#	emit_signal("booster_pressed", BoosterInfo.booster_vault[1])

func _on_Booster2_pressed():
	emit_signal("booster_pressed", $MarginContainer/HBoxContainer/Booster2.type)
# OLD FORM:
#	emit_signal("booster_pressed", BoosterInfo.booster_vault[2])

func _on_Booster3_pressed():
	emit_signal("booster_pressed", $MarginContainer/HBoxContainer/Booster3.type)
# OLD FORM:
#	emit_signal("booster_pressed", BoosterInfo.booster_vault[3])
