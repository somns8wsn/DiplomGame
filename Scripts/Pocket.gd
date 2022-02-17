extends Node

var pocket = {}

func add(key, label, desc=''):
	pocket[key] = {
		'key' : key,
		'label' : label,
		'desc' : desc if desc else label
	}

func get(key):
	return pocket[key] if pocket.has(key) else null
	
func has(key):
	return pocket.has(key)
	
func remove(key):
	if has(key):
		pocket.erase(key)
		
func full_remove(key):
	pocket.erase(key)
	
func get_pocket():
	return pocket

func _ready():
	pass # Replace with function body.
