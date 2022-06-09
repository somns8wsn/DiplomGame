extends Control

#func _input(event):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		$CanvasYesNo.visible = !$CanvasYesNo.visible



func _on_YesButton_button_down():
	get_tree().change_scene("res://Scenes/home_01.tscn")


func _on_NoButton_button_down():
	get_tree().change_scene("res://Scenes/Menu/gamemenu.tscn")
