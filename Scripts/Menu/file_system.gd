extends Node

var files = File.new()
var directory = Directory.new()

func save_data(file_name, data):
	files.open_encrypted_with_pass("user://"+file_name, File.WRITE, "5454")
	files.store_var(data)
	files.close()
	print('записано')
	

func load_data(file_name):
	files.open_encrypted_with_pass("user://"+file_name, File.READ, "5454")
	var content = files.get_var()
	files.close()
	return content

