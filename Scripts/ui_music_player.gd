extends CanvasLayer


func _input(event):
	if event.is_action_pressed("music_player"):
		$music_player.visible = !$music_player.visible
