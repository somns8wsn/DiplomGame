extends StaticBody2D





func on_touch_area_player_grap_entered(body):
	if body.name == "player":
		G.is_on_ladder = true
	


func _on_touch_area_player_grap_exited(body):
	if body.name == "player":
		G.is_on_ladder = false
