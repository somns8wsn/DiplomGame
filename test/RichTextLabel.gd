extends RichTextLabel

export (Color,RGB) var mouse_out
export (Color,RGB) var mouse_over



func _on_RichTextLabel_mouse_entered():
	set_modulate(mouse_out)
	set_scale(Vector2(1.25,1.25))


func _on_RichTextLabel_mouse_exited():
	set_modulate(mouse_over)
	set_scale(Vector2(1.1,1.1))
