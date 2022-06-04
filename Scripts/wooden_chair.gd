extends StaticBody2D

var is_player_near_chair := false
var is_player_clicked_chair := false

signal _on_player_sat()

func _is_near_chair_player_entered(body) -> void:
	if "player" in body.name:
		print("near")
		is_player_near_chair = true
	else:
		is_player_near_chair = false


func _on_chair_mouse_left_click_input_event(_viewport, _event, _shape_idx) -> void:
	if Input.is_action_just_pressed("left_click"):
		print("clicked")
		is_player_clicked_chair = true
	else:
		is_player_clicked_chair = false

func _get_pos_difference():
	var pos_differ = abs(get_parent().get_node("player").position.x - get_parent().get_node("wooden_chair").position.x)
	if pos_differ < 60:
		return true

func sitting_check() -> void:
		if is_player_near_chair == true and is_player_clicked_chair == true:
			emit_signal("_on_player_sat")
			
func _process(_delta) -> void:
	#_get_pos_difference()
	sitting_check()
