extends Area2D


# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_key_pressed(KEY_SHIFT):
		$CollisionShape2D.disabled = false
	else:
		$CollisionShape2D.disabled = true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
