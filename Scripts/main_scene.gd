extends Node

var floor_junk := preload("res://Scenes/floor_junk.tscn")

func _ready() -> void:
	randomize()

	for _i in range(100):
		var junk = floor_junk.instance()
		add_child(junk)
		junk.position.x = rand_range(0, 1920)
		junk.position.y = rand_range(0, 1080)


func _process(_delta) -> void:
	pass

func _physics_process(_delta) -> void:
	pass
