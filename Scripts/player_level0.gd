extends Node

static func move(mover, delta):
	# Anything and everything related to movement goes in here
	if Input.is_key_pressed(KEY_D):
		mover.position += Vector2(100 * delta, 0)
	if Input.is_key_pressed(KEY_A):
		mover.position += Vector2(-100 * delta, 0)

static func jump(mover, event):
	# Anything that happens when the player jumps happens here
	pass