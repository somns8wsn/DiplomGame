extends Node2D

var item_name
var item_quantity

func _ready():
	var rand_val = randi() & 3
	if rand_val == 0:
		item_name = "Money"
	elif rand_val == 1:
		item_name = "Bread"
	else:
		item_name = "trash_cigarette_box"

	$TextureRect.texture = load("res://Sprites/item_files/" + item_name + ".png")
	var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	item_quantity = randi() % stack_size + 1
	
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.text = String(item_quantity)

func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)

func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)


#func _ready():
#	if randi() % 2 == 0:
#		$TextureRect.texture = load("res://Sprites/item_files/50_cent.png")
#	else:
#		$TextureRect.texture = load("res://Sprites/item_files/key.png")


#func set_item(name, texture):
#	$Item_button/Label.text = name
#	$Item_button.texture_normal = load("res://Sprites/"+texture+"")
	
	
	
#func _process(_delta):
	
#	if $Item_button.is_hovered():
#		$Item_button/Label.visible = true
#	else:
#		$Item_button/Label.visible = false
	
#	if $Item_button.pressed == true:
#		queue_free()
#		P.pocket.append(1)
#		print(P.pocket)
