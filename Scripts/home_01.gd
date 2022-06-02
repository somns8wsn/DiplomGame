extends Node2D

#var floor_junk := preload("res://Scenes/floor_junk.tscn")

func _ready() -> void:
	$slippers/Sprite.set_flip_h(true)

#	randomize()
#
#	for _i in range(100):
#		var junk = floor_junk.instance()
#		add_child(junk)
#		junk.get_node("CollisionShape2D").set_scale(Vector2(3, 3))
#		junk.set_position(Vector2($Area2D.position.x + (randi() % 100 if randi() % 2 == 0 else -(randi() % 100)),
#								  $Area2D.position.y + (randi() % 100 if randi() % 2 == 0 else -(randi() % 100))))
#		junk.get_node("CollisionShape2D").set_scale(Vector2(1, 1))
#	var i = 0
#	while i == 0:
#		var junk = floor_junk.instance()
#		add_child(junk)
#		junk.position.x = rand_range($Position2D1.position.x, $Position2D2.position.x)
#		junk.position.y = rand_range($Position2D1.position.y, $Position2D3.position.y)

func _physics_process(_delta: float) -> void:
	pass
