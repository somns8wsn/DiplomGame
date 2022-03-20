extends StaticBody2D


func _on_touch_grap_area_body_entered(body) -> void:
	if body.name == "grap_area":
		G.is_on_ladder = true

func _on_touch_grap_area_body_exited(body) -> void:
	if body.name == "grap_area":
		G.is_on_ladder = false
