extends Area2D

signal beginTalk
signal endTalk
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass"text"
func showTalk():
	$CanvasLayer/talk.show()
	emit_signal("beginTalk")
	$Timer.start()

func _on_Timer_timeout():
	$CanvasLayer/talk.hide()
	emit_signal("endTalk")
	$Timer.stop()
