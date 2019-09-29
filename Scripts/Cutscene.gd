extends Sprite

var label
var symbols

func _ready():
	label = $Label
	$Label2.text = "Hands over @$%#, great! Just what you wanted, a problem..."
	symbols = ["&","*","%","#","@","<",">","^","?","?","?","=",";"]
	pass

func _process(delta):
	var randtext = ""
	for i in range(4):
		randtext += symbols[randi() % symbols.size()]
	$Label2.text = "Hands over " + randtext + ", great! Just what you wanted, a problem..."
	pass
	
func animate_text(text):
	label.text = text
	label.percent_visible = 0
	
	$Tween.interpolate_property($Label, "percent_visible", 0, 1, 1.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func play_cutscene():
	animate_text("You're finally here! thank fuck...")
	yield($Tween, "tween_completed")
	yield(get_tree().create_timer(1), "timeout")
	animate_text("Boss told me to hand this off to you")
	yield($Tween, "tween_completed")
	yield(get_tree().create_timer(1), "timeout")
	animate_text("Not sure what it is, but I hate it")
	yield($Tween, "tween_completed")
	yield(get_tree().create_timer(1), "timeout")
	animate_text("Shit makes things...weird")
	yield($Tween, "tween_completed")
	yield(get_tree().create_timer(1), "timeout")
	animate_text("Anyway, boss wanted you up on the roofs and this is your problem now")
	yield($Tween, "tween_completed")
	yield(get_tree().create_timer(1), "timeout")
	label.text = ""
	$Label2.visible = true
	
	get_parent().get_node("Player").paused = false

func _on_CutsceneArea_body_entered(body):
	if body is KinematicBody2D:
		get_parent().get_node("Player").paused = true
		get_parent().get_node("CutsceneArea").queue_free()
		play_cutscene()
