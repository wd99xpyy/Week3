extends StaticBody2D


var bombSize = 1
onready var explosion_scene = preload("res://Qingyue/explosion.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func explosionExpand():
	for i in bombSize:
		var moveposition = (i+1)*33-16
		instanceExplosion("upanddone",Vector2(position.x,position.y-moveposition))
		instanceExplosion("upanddone",Vector2(position.x,position.y+moveposition))
		instanceExplosion("leftandright",Vector2(position.x-moveposition,position.y))
		instanceExplosion("leftandright",Vector2(position.x+moveposition,position.y))

func instanceExplosion(animi,theposition):
	var explosion = explosion_scene.instance()
	explosion.position = theposition
	explosion.animationPlay(animi)
	get_parent().add_child(explosion)
	
func _on_AnimationPlayer_animation_finished(anim_name):
	instanceExplosion("center",position)
	explosionExpand()
	
