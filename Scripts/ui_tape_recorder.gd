extends CanvasLayer


func _input(event):
	if event.is_action_pressed("TapeRecorder"):
		$TapeRecorder.visible = !$TapeRecorder.visible

