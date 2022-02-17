extends Node2D

onready var item = preload("res://Scenes/Item.tscn")

func get_player():
	return $Player
	
func update_lable(value):
	get_parent().update_lable(value)

func _ready():
	var items = ["hotdog"]
	for i in range(60):
		randomize()
		var a = int(rand_range(0,1))
		var new_item = item.instance()
		$Items.add_child(new_item)
		new_item.set_item(items[a])
		new_item.position = Vector2(int(rand_range(0, 31*31)), int(rand_range(0, 31*31)))
	pass 
