extends Area2D


func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		get_tree().change_scene("res://Scenes/Level3.tscn")
