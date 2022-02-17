extends Node

var item = ""

func set_item(name, texture):
	$Item_button/Label.text = name
	$Item_button.texture_normal = load("res://Sprites/"+texture+"")
	
	
	
func _process(_delta):
	
	if $Item_button.is_hovered():
		$Item_button/Label.visible = true
	else:
		$Item_button/Label.visible = false
	
	if $Item_button.pressed == true:
		queue_free()
		P.pocket.append(1)
		print(P.pocket)
