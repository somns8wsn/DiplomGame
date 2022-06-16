extends Control

#func load_level():
#	var data = Fs.load_level("save.dat")
#	$home_01/topdown_player.transform = data["transform"]
#
#func save_level():
#	Fs.save_data("save.dat", {
#		"transform" : $home_01/topdown_player.transform
#
#	})


func _on_LoadButton_pressed():
#	load_level()
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/gamemenu.tscn")


func _on_SaveButton_pressed():
#	save_level()
	pass
