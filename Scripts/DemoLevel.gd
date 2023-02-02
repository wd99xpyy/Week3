extends Node2D

func _ready():
	$YSort/Player.global_position = Vector2(420, 280)
	$YSort/Player/AnimationPlayer.play("playerposition")
	$Door.currentLevel = 0
