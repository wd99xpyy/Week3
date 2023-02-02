extends KinematicBody2D

onready var anim = $PlayerSprites

var old_pos : Vector2 = position
var currentDirection = ""
var otherAnimation = false

func _ready():
	pass

func _physics_process(_delta):
	if otherAnimation == false:
		if old_pos != position:
			if position.x-old_pos.x > 0:
				$PlayerSprites.animation = "right"
				currentDirection = "Right"
			elif position.x-old_pos.x < 0:
				$PlayerSprites.animation = "left"
				currentDirection = "Left"
			elif position.y-old_pos.y > 0:
				$PlayerSprites.animation = "front"
				currentDirection = "Front"
			elif position.y-old_pos.y < 0:
				$PlayerSprites.animation = "back"
				currentDirection = "Back"
	old_pos = position

func attack():
	#otherAnimation = true
	stopMove()
	print("attacked")
	var attackAnimation = "attack"+currentDirection
	#$AnimationPlayer.stop(false)
	$PlayerSprites.animation = attackAnimation
	#$YSort/Player/AnimationPlayer.stop()

func stopMove():
	otherAnimation = true
	$AnimationPlayer.stop(false)
	$PlayerSprites.animation = "Idle"

func startMove():
	otherAnimation = false
	$AnimationPlayer.play()

func _on_PlayerSprites_animation_finished():
	if otherAnimation == true:
		startMove()
