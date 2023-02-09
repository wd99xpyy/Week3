extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	var theanim = $AnimationPlayer.current_animation
	var velocity = Vector2.ZERO
	if theanim == "bulletUp":
		velocity.y = -1
	if theanim == "bullet":
		velocity.y = 1
	if theanim =="bulletLeft":
		velocity.x = -1
	if theanim == "bulletRight":
		velocity.x = 1
		
	position += velocity * delta*100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func animationPlay(theanim):
	$AnimationPlayer.play(theanim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

func _on_bullet_area_entered(area):
	if area.name == "enemy":
		queue_free()
