extends CanvasLayer

func _input(event):
	if event.is_action_pressed("gamemenu"):
		$gamemenu.visible = !$gamemenu.visible
