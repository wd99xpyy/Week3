extends KinematicBody2D

onready var bomb_scene = preload("res://Qingyue/bomb.tscn")
onready var bullet_scene = preload("res://Qingyue/bullet.tscn")
onready var anim = $PlayerSprites
export (int) var speed = 128
var velocity = Vector2()
var old_pos : Vector2 = position
#var currentDirection = ""
var otherAnimation = false
var currentdirection = ""
var lives = 5
var bombable = true

func _ready():
	$PlayerSprites.animation = "Idle"
	hideAttackArea()

func updatLiveBar():
	$ColorRect/ColorRect.rect_size.x = 6*lives
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		$PlayerSprites.animation = "right"
		currentdirection = "Right"
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		$PlayerSprites.animation = "left"
		currentdirection = "Left"
	if Input.is_action_pressed("down"):
		velocity.y += 1
		$PlayerSprites.animation = "front"
		currentdirection = ""
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		$PlayerSprites.animation = "back"
		currentdirection = "Up"
	velocity = velocity.normalized() * speed
	if Input.is_action_pressed("bomb"):
		if bombable:
			var bomb = bomb_scene.instance()
			bomb.position = getBombPosition()
			get_parent().add_child(bomb)
			bombable = false
			$bombCD.start()
		#stopMove()
		#queue_free()
	if Input.is_action_pressed("attack"):
		attack()
	if Input.is_action_pressed("shoot"):
		shoot()
	if velocity == Vector2.ZERO and !otherAnimation:
		$PlayerSprites.animation = "Idle"+currentdirection

func shoot():
	stopMove()
	$PlayerSprites.animation = "shoot"+currentdirection
	var bullet = bullet_scene.instance()
	bullet.position = position
	bullet.animationPlay("bullet"+currentdirection)
	get_parent().add_child(bullet)


func getBombPosition():
	var positionX = int(position.x-16)%32
	var positionY = int(position.y-16)%32
	
	if(positionX<16):
		positionX = int(position.x) - positionX
	else:
		positionX = int(position.x) + 32-positionX
	if(positionY<16):
		positionY = int(position.y) - positionY
	else:
		positionY = int(position.y) + 32 - positionY
	return Vector2(positionX,positionY)

func _physics_process(_delta):
	if otherAnimation:
		velocity = Vector2.ZERO
	else:
		get_input()
	velocity = move_and_slide(velocity)

func hideAttackArea():
	$attack.monitorable = false
	$attack/attackLeft.disabled = true
	$attack/attackUp.disabled = true
	$attack/attackRight.disabled = true
	$attack/attack.disabled = true
	
func attack():
	stopMove()
	var attackAnimation = "attack"+currentdirection
	$PlayerSprites.animation = attackAnimation
	$attack.monitorable = true
	if currentdirection == "Right":	
		$attack/attackRight.disabled = false
	if currentdirection == "Left":	
		$attack/attackLeft.disabled = false
	if currentdirection == "Up":
		$attack/attackUp.disabled = false
	if currentdirection == "":
		$attack/attack.disabled = false

func stopMove():
	otherAnimation = true
	#$AnimationPlayer.stop(false)
	$PlayerSprites.animation = "Idle"+currentdirection

func startMove():
	otherAnimation = false
	#$AnimationPlayer.play()

func _on_PlayerSprites_animation_finished():
	if lives <= 0:
		print(get_parent().get_parent().name)
		if get_parent().get_parent().name == "MainLevel":
			get_tree().change_scene("res://Scenes/DemoLevel.tscn")
		if get_parent().get_parent().name == "Level2":
			get_tree().change_scene("res://Qingyue/Level2.tscn")
	if otherAnimation == true:
		startMove()
		hideAttackArea()

func playerDead():
	stopMove()
	$PlayerSprites.animation = "dead"+currentdirection


func _on_enemy_PlayerAttack():
	lives -= 1
	updatLiveBar()
	if lives <= 0:
		playerDead()


func _on_bombCD_timeout():
	bombable = true


func _on_enemy2_PlayerAttack():
	pass # Replace with function body.
