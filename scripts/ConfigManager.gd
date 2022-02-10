extends Node

onready var path = "user://config.ini"
var sound_on = true
var music_on = true

func _ready():
	load_config()
	
func save_config():
	var config = ConfigFile.new() # Creates a new configuration file, a new class in Godot
	config.set_value("audio", "sound", sound_on)
	config.set_value("audio", "music", music_on)
	
	var err = config.save(path)
	if err != OK:
		print("something went wrong")
	
func load_config():
	var config = ConfigFile.new()
	# Creating a dictionary
	var default_options = {
			"sound": true,
			"music": true
			}
	var err = config.load(path)
	if err != OK:
		return default_options 
	var options = {} # Empty dictionary
	sound_on = config.get_value("audio", "sound", default_options.sound)
	music_on = config.get_value("audio", "music", default_options.music)
	return options








