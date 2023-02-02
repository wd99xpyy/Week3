extends Area2D

onready var anim = $"Door Animation"
onready var block = $"Door Body/Door Body Collider"
onready var collider = $"Door Collider"

var currentLevel = ""
func _ready():
	pass


func _on_Door_body_entered(body):
	if body.name == "Player" || body.name == "PlayerAlternate":
		print("cllect " + body.name)
		anim.play("Open")

func _on_Door_Animation_animation_finished(anim_name):
	if anim_name == "Open":
		block.disabled == true
		if currentLevel== 0:
			get_tree().change_scene("res://Qingyue/Level2.tscn")
		elif currentLevel ==1:
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
			
