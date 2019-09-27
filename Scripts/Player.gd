extends Node2D

var script

# Called when the node enters the scene tree for the first time.
func _ready():
	script = load("res://Scripts/player_level0.gd")

func _process(delta):
	script.move(self, delta)
	pass

func _input(event):
	pass


func load_script(level_num):
	script = load("res://Scripts/player_level" + level_num + ".gd")