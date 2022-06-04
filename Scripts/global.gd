extends Node


var is_on_ladder := false # check if player is on ladder
var is_player_sitting := false # check if player is sitting now
var is_indoor := true # check if player is in room


func _process(_delta: float) -> void:

	if Input.is_action_just_pressed("quit_debug"):
		get_tree().quit()

