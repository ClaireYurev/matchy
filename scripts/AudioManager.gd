extends Node

# First, reference the two Nodes that we made, using onready var
onready var music_player = $MusicPlayer
onready var sound_player = $SoundPlayer

# We create two arrays of preloads
var available_music = [
preload("res://audio/music/theme-1.ogg"),
preload("res://audio/music/theme-2.ogg"),
preload("res://audio/music/theme-3.ogg"),
preload("res://audio/music/theme-4.ogg")
]

var available_sounds = [
preload("res://audio/sounds/1.ogg"),
preload("res://audio/sounds/2.ogg"),
preload("res://audio/sounds/3.ogg"),
preload("res://audio/sounds/4.ogg"),
preload("res://audio/sounds/5.ogg"),
preload("res://audio/sounds/6.ogg"),
preload("res://audio/sounds/7.ogg"),
preload("res://audio/sounds/8.ogg")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_volume()
	play_random_music()

func play_random_music():
	var temp = floor(rand_range(0, available_music.size()))
	music_player.stream  = available_music[temp]
	music_player.play()
	
func play_random_sound():
	var temp = floor(rand_range(0, available_sounds.size()))
	sound_player.stream  = available_sounds[temp]
	sound_player.play()

func play_fixed_sound(sound):
	sound_player.stream = available_sounds[sound]
	sound_player.play()

# New: NOW this will set the volume based on that CONFIG file we made	
func set_volume():
	if ConfigManager.sound_on:
		music_player.volume_db = -26
		sound_player.volume_db = -16
	else:
		music_player.volume_db = -80
		sound_player.volume_db = -80
