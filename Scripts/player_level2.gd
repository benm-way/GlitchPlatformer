
extends Node

static func move(mover, delta):
	# Anything and everything related to movement goes in here
	var dir = Vector2(0,0)
	mover.max_speed = 200
	
	if Input.is_key_pressed(KEY_D):
		dir.x += 1
	if Input.is_key_pressed(KEY_A):
		dir.x -= 1
	if Input.is_key_pressed(KEY_SPACE) and mover.is_on_floor():
		mover.vel.y = -2000
	if Input.is_key_pressed(KEY_SHIFT):
		for i in range(1,20):
			mover.max_speed = mover.max_speed*2
			#yield(0.5)
	
	dir = dir.normalized()
	
	var hvel = mover.vel
	hvel.y = 0
	
	var target = dir * mover.max_speed

	
	var accel
	
	if (dir.dot(hvel) > 0):
		accel = mover.ACCEL
	else:
		accel = mover.DEACCEL
		
	hvel = hvel.linear_interpolate(target, accel*delta)
	mover.vel.x = hvel.x
	
	# Jumping
	if not mover.is_on_floor():
		if (mover.vel.y < 0):
			mover.vel.y += mover.GRAVITY * mover.JUMP_MULT * delta
		elif (mover.vel.y >= 0 and !Input.is_key_pressed(KEY_SPACE)):
			mover.vel.y += mover.GRAVITY * mover.LOW_JUMP_MULT * delta
		mover.vel.y += mover.GRAVITY * delta
	
	mover.vel = mover.move_and_slide(mover.vel, Vector2(0,-1))

# For something called every frame
static func process(player, delta):
	pass

# For something that happens on an input event
static func input(player, event):
	pass
	