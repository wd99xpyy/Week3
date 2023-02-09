extends Node2D


func _ready():
	$YSort/Player.global_position = Vector2(400, 60)
	#$YSort/Player/AnimationPlayer.play("level2")
	$Door.currentLevel = 1

func _unhandled_input(event):
	if event.is_action_pressed("Restart"):
		get_tree().change_scene("res://Qingyue/Level2.tscn")

