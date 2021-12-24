extends Control

onready var pocket_button = $AppearButton
onready var pocket = $Pocket



func _process(_delta):
	
		if pocket_button.pressed == true:
			pocket.visible = true
	
		if pocket_button.pressed == false:
			pocket.visible = false
	
