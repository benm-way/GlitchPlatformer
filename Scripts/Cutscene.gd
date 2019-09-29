extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_cutscene():
	
	get_parent().get_node("Player").paused = false

func _on_CutsceneArea_body_entered(body):
	if body is KinematicBody2D:
		get_parent().get_node("Player").paused = true
		get_parent().get_node("CutsceneArea").queue_free()
		play_cutscene()
