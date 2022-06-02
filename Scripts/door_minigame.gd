extends Node2D


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	$topdown_player.position = get_global_mouse_position()
	pass
