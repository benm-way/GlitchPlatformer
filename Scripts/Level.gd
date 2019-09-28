extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.load_script(self.name[-1])
	$WinBox.connect("body_entered", $Player, "transition")

