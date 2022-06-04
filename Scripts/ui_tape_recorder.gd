extends CanvasLayer


func _input(event):
	if event.is_action_pressed("tapeRecorder"):
		$tapeRecorder.visible = !$tapeRecorder.visible

