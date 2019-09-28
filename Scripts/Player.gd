extends Node2D

var script

var vel = Vector2(0,0)
var max_speed = 200

const ACCEL = 4
const DEACCEL = 8
const GRAVITY = 30
const JUMP_MULT = 2.5
const LOW_JUMP_MULT = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	script = load("res://Scripts/player_level0.gd")

func _process(delta):
	script.move(self, delta)
	pass

func _input(event):
	script.jump(self, event)
	pass


func load_script(level_num):
	script = load("res://Scripts/player_level" + level_num + ".gd")