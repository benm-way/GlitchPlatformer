extends Node

static func move(mover, delta):
	if Input.is_key_pressed(KEY_D):
		mover.position += Vector2(100 * delta, 0)

static func jump(mover, event):
	pass