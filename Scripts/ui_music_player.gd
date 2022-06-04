extends CanvasLayer


func _input(event):
	if event.is_action_pressed("MusicPlayer"):
		$MusicPlayer.visible = !$MusicPlayer.visible
