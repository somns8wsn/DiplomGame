extends Node2D

var item = ""

func set_item(item_name):
	$Sprite.texture = load("res://Sprites/%s.png" % item_name)
	item = item_name
	

func _input(event):
	if event.is_action_pressed("left_click"):
		get_parent().remove_child(self)
		pick(self)
	
