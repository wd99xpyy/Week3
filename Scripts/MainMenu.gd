extends CanvasLayer

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/DemoLevel.tscn")


func _on_Button_pressed():
	$Control.show()
	$Control/ColorRect.show()


func _on_close_pressed():
	$Control/ColorRect.hide()
	$Control.hide()


func _on_close2_pressed():
	$Control/ColorRect2.hide()
	$Control.hide()


func _on_Button2_pressed():
	$Control.show()
	$Control/ColorRect2.show()


func _on_Level1_pressed():
	get_tree().change_scene("res://Scenes/DemoLevel.tscn")


func _on_Level2_pressed():
	get_tree().change_scene("res://Qingyue/Level2.tscn")
