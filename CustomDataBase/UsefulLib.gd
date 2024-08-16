extends Node

func reverse_string(old_string:String) -> String:
	var new_string := "" 
	for index in range(old_string.length()-1, -1, -1):
		new_string += old_string[index]
	return new_string
