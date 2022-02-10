extends Node

# The AudioPlayer node exists only to receive signals from other things
# and then play audio (sounds or music). Currently, as audio already 
# plays in the background, AudioPlayer will only be used to play
# sounds as effects for events in the game (clicks, destruction, etc)
# So we will not be needing the ready function at all.

func play_click_noise():
	AudioManager.play_fixed_sound(1)

func play_random_noise():
	AudioManager.play_random_sound()

func _on_grid_play_audio():
	play_random_noise()
