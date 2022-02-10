extends Node

var level_info = {}
var default_level_info = {
	1:{
		"unlocked": true,
		"high score": 0,
		"stars unlocked": 0
		}
	}

var level_scroll_value = 0

onready var path = "user://saved.yyz"

func _ready():
	#level_info = load_data()
	level_info = default_level_info
	print("You are now on level:", level_info)
	#level_info[1] = {
	#	"unlocked": true,
	#	"high score": 0,
	#	"stars unlocked": 0
	#}
	# save_data()
	
func save_data():
	var file = File.new()
	var err = file.open(path, File.WRITE)
	if err != OK:
		print ("something went wrong during a saving attempt")
		return
	# Next (below) is file dot store VARIANT (variant of the level)
	file.store_var(level_info) # This could alternatively be done to a JSON file too
	file.close() # Make sure to close so that you're not taking up ton of ram
	pass
	
func load_data():
	var file = File.new()
	var err = file.open(path, File.READ)
	if err != OK:
		return default_level_info
		print ("something went wrong during an attempt to load")
	var read = {}
	read = file.get_var()
	return read

func change_level_scroll_value(new_value):
	level_scroll_value = new_value
