extends Area2D
func _on_ExitBox_body_entered(body):
	if body is KinematicBody2D:
		get_tree().quit()
