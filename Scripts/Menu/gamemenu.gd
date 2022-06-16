extends Node2D

func _on_ContinueGameButton_pressed():
	get_tree().paused = false
	set_visible(false)

func _on_NewGameButton_button_down():
	get_tree().change_scene("res://Scenes/Menu/CanvasYesNo.tscn")

func _on_SaveGameButton_button_down():
	get_tree().change_scene("res://Scenes/Menu/SaveGameMenu.tscn")

#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		$gamemenu.visible = !$gamemenu.visible

#func _input(event):
#	if event.is_action_pressed("ui_cancel"):
#		get_tree().paused = !get_tree().paused

func _on_SaveLoadGameButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/save&loadgamemenu.tscn")

func _on_QuitGameButton_button_down():
	get_tree().quit()



