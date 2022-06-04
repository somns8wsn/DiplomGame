extends Node


export var fade_distance = 1500
export var max_opacity = 1
export var min_opacity = 0.2
export var	buffer = 0.3

#var floor_junk := preload("res://Scenes/floor_junk.tscn")

func _ready() -> void:
	randomize()

#	for _i in range(100):
#		var junk = floor_junk.instance()
#		add_child(junk)
#		junk.position.x = rand_range(0, 1920)
#		junk.position.y = rand_range(0, 1080)


func _process(_delta) -> void:
	pass

func _physics_process(_delta) -> void:
	var player_pos = $topdown_player.get_position()
	var obj_pos = $Sprite.get_position()
	var distance = player_pos.distance_to(obj_pos)

	$Sprite.modulate = Color(1,1,1,
							clamp(1 - ( ( (distance)/fade_distance) - buffer ),
							min_opacity,
							max_opacity))
	pass
