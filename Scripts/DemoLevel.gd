extends Node2D

func _ready():
	$YSort/Player.global_position = Vector2(450, 470)
	#$YSort/Player/AnimationPlayer.play("playerposition")
	$Door.currentLevel = 0
	
func _unhandled_input(event):
	if event.is_action_pressed("Restart"):
		get_tree().change_scene("res://Scenes/DemoLevel.tscn")
