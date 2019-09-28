extends Node2D

var script
var level

var vel = Vector2(0,0)
var max_speed = 200
var up = Vector2(0, -1)

var ACCEL = 4
var DEACCEL = 8
var GRAVITY = 1800
var JUMP_MULT = 2.5
var LOW_JUMP_MULT = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	script = load("res://Scripts/player_level0.gd")

func _process(delta):
	script.process(self, delta)
	script.move(self, delta)
	pass

func _input(event):
	script.input(self, event)
	if event is InputEventKey and event.scancode == KEY_F and event.is_pressed() and !event.is_echo():
		transition(self)
	pass


func load_script(level_num):
	script = load("res://Scripts/player_level" + level_num + ".gd")
	
func transition(area):
	if !(area is StaticBody2D):
		var level_num = int(area.get_parent().name[-1]) + 1
		if(get_tree().change_scene("res://Scenes/Level" + str(level_num) + ".tscn") > 0):
			get_tree().change_scene("res://Scenes/End.tscn")