extends KinematicBody2D
export (int) var speed = 200
onready var Inventory = get_viewport().get_node("Root/Inventory/Control")
var items = 0
var inventory = {}

func pick(item):
	var items = item.get_name()
	if items in inventory.keys():
		inventory[items] += item.sget_amount()
	else:
		inventory[items] = item.get_amount()
	Inventory.update_inventory(inventory)

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	position.x = clamp(position.x, 0, 1000)
	position.y = clamp(position.y, 0, 1000)

func _unhandled_input(event):
	if event.is_action_pressed("Inventory"):
		Inventory.toggle_inventory(inventory)
