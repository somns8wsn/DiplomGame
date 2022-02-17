extends Node2D

func update_lable(value):
	get_node("Inventory/Control/Counter").text = "Items: %s" % str(value)

func _ready():
	pass
