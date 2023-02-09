extends Area2D
signal PlayerAttack

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_enemy_body_entered(body):
	if body.name == "Player":
		emit_signal("PlayerAttack")
	


func _on_enemy_area_entered(area):
	if area.name == "bullet":
		$AnimatedSprite.play()
		$AnimationPlayer.play("dead")
	if area.name == "attack":
		$AnimatedSprite.play()
		$AnimationPlayer.play("dead")
	if area.name == "bomb":
		$AnimatedSprite.play()
		$AnimationPlayer.play("dead")
