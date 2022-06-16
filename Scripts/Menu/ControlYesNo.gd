extends Control




func _on_YesButton_button_down():
	get_tree().change_scene("res://Scenes/home_01.tscn")
	get_tree().paused = false
	set_visible(false)

func _on_NoButton_button_down():
	get_tree().change_scene("res://Scenes/Menu/gamemenu.tscn")
	get_tree().paused = false
	set_visible(false)
