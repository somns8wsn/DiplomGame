extends Node2D

var floor_junk := preload("res://Scenes/floor_junk.tscn")

func _ready() -> void:
	$slippers/Sprite.set_flip_h(true)

	randomize()

	for _i in range(10):
		var junk = floor_junk.instance()
		add_child(junk)
		junk.position.x = rand_range(0, 1920)
		junk.position.y = rand_range(0, 1080)

func _physics_process(delta: float) -> void:
	#$dumbbell.position.y = 578.346
	pass
