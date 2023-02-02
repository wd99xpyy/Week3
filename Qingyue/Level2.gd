extends Node2D


func _ready():
	$YSort/Player.global_position = Vector2(100, 100)
	$YSort/Player/AnimationPlayer.play("level2")
	$Door.currentLevel = 1



func _on_enemy_PlayerAttack():
	#print("attack"+$YSort/Player.currentDirection)
	$YSort/Player.attack()


func _on_enemy2_PlayerAttack():
	$YSort/Player.attack()


func _on_npc_body_entered(body):
	if body.name == "Player":
		$YSort/npc/CanvasLayer/talk/Label.text = "Some one wait you at north"
		$YSort/npc.showTalk()
		print("Some one wait you at north")
	
func _on_npc2_body_entered(body):
	if body.name == "Player":
		$YSort/npc2/CanvasLayer/talk/Label.text = "Look around in the bushes"
		$YSort/npc2.showTalk()
		print("Look around in the bushes")	


func _on_enemy3_body_entered(body):
	$YSort/Player.attack()



func _on_npc3_body_entered(body):
	if body.name == "Player":
		$YSort/npc3/CanvasLayer/talk/Label.text = "Almost Here!!"
		$YSort/npc3.showTalk()
		print("Almost Here!!")	
		



func _on_npc_beginTalk():
	$YSort/Player.stopMove()

func _on_npc_endTalk():
	$YSort/Player.startMove()

func _on_npc2_beginTalk():
	$YSort/Player.stopMove()

func _on_npc2_endTalk():
	$YSort/Player.startMove()

func _on_npc3_beginTalk():
	$YSort/Player.stopMove()

func _on_npc3_endTalk():
	$YSort/Player.startMove()
