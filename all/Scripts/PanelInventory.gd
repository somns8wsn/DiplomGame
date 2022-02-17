extends NinePatchRect

onready var item = preload("res://Scenes/ItemHutdog.tscn")
onready var container = $Scroll/BlockItems

func _ready():
	clear()
	visible = false

func clear():
	for i in container.get_children():
		container.remove_child(i)
		i.queue_free()
		
func show_inventory(inventory):
	clear()
	for i in inventory.keys():
		var new_item = item.instance()
		container.add_child(new_item)
		new_item.set(i, inventory[i])
