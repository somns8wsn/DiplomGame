extends Node2D

export var fade_distance = 1500
export var max_opacity = 1
export var min_opacity = 0.2
export var offset = 0.3

var floor_junk := preload("res://Scenes/floor_junk.tscn")
onready var TV = load("TV")

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

func _process(_delta) -> void:
	pass

func _physics_process(_delta) -> void:
	var player_pos = $topdown_player.get_position()
	var obj_pos = $TV/TV.get_position()
	var distance = player_pos.distance_to(obj_pos)
	$TV/TV.modulate = Color(1,1,1,
							clamp(1 - ( ( (distance)/fade_distance) - offset ),
							min_opacity,
							max_opacity))
	pass


func _on_Area2D_area_entered(area):
	pass
