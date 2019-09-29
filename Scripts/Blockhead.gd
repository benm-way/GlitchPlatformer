extends Sprite

var moving = true
export var direction = 1

func _ready():
	$AnimationPlayer.play("Walk")
	if direction == -1:
		self.flip_h = true
		$Area2D.scale = -$Area2D.scale

func _process(delta):
	if moving:
		self.position.x += direction * 100 * delta
	if self.position.x >= 1500 and direction == 1:
		self.position.x = 760
	if self.position.x <= 760 and direction == -1:
		self.position.x = 1500
	
func annoy(player):
	moving = false
	$AnimationPlayer.play("Idle")
	$Label.text = ""
	$Label.rect_position.x += (randi() % 9) - 3
	$Label.rect_position.y += (randi() % 9) - 3
	player.paused = true
	for i in range(40):
		$Label.text += "blah "
		yield(get_tree().create_timer(0.1),"timeout")
	get_tree().change_scene("res://Scenes/Level2.tscn")

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		annoy(body)
