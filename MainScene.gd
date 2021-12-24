extends Node2D

onready var item = preload("res://Item.tscn")

var items = 0

func pick(item):
	items += 1
	print("Items: %s" % str(items))

func _ready():
	var items = ["ButtonNormal", "ButtonPressed", "Pocket"]
	for _i in range (3):
		randomize()
		var a = int(rand_range(0, 4))
		var new_item = item.instance()
		$Items.add_child(new_item)
		new_item.set_item(items[a])
		new_item.position = Vector2(int(rand_range(0, 500)), int(rand_range(0, 500)))

