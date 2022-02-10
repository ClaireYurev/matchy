extends "res://scripts/BaseMenuPanel.gd"

signal sound_change
signal back_button
export (Texture) var sound_on
export (Texture) var sound_off

func _on_Button_1_pressed():
	ConfigManager.sound_on = !ConfigManager.sound_on
	change_sound_texture()
	ConfigManager.save_config()
	# Order matters for below: it is the LAST line of this method
	# so that there is no situation where the sound plays even if the
	# user is turning the sound off
	AudioManager.set_volume()
	AudioManager.play_fixed_sound(7)
	
func change_sound_texture():
	if ConfigManager.sound_on == true:
		$"MarginContainer/Graphic and Buttons/Buttons/Button 1".texture_normal = sound_on
	else:
		$"MarginContainer/Graphic and Buttons/Buttons/Button 1".texture_normal = sound_off

func _on_Button_2_pressed():
	emit_signal("back_button")
	# Order matters for below: it is the LAST line of this method
	# so that there is no situation where the sound plays even if the
	# user is turning the sound off
	AudioManager.set_volume()
	AudioManager.play_fixed_sound(7)

func _on_GameMenu_read_sound():
	change_sound_texture()
