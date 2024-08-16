extends Control

@onready var current_file_name_display = $File_Container/Name
@onready var last_save_time_display = $"File_Container/Last Save Time"


@onready var new_file_name = $File_Container/NewFile_Container/FileName
@onready var load_file_name = $File_Container/Load_Container/FileName


@onready var editable_title = $File_Container/Edit_Container/Title
@onready var editable_description = $File_Container/Edit_Container/Description
@onready var editable_content = $File_Container/Edit_Container/Content

var current_file_name : String
var current_file_data : FileData
var file_data_path : String = "res://FileDatas/"
var last_saved_time : float



#region UI Functions

func _on_new_pressed():
	new_file_data(new_file_name.text)

func _on_load_pressed():
	load_file_data(load_file_name.text)

func _on_save_pressed():
	edit_file_data(current_file_data,editable_title.text,editable_description.text,editable_content.text)
	save_file_data(current_file_data, current_file_name)

func _on_export_pressed():
	show_file_data(current_file_data)

#endregion

#region File Functions

func _process(delta):
	if current_file_data:
		last_saved_time += delta
		current_file_name_display.text = ( "Currently Editing : " + current_file_name + ".tres")
		last_save_time_display.text = ( current_file_name + ".tres Was Last Saved " + str(round(last_saved_time / 60)) + " Minutes Ago.")

func load_file_data(filename : String):
	current_file_data = ResourceLoader.load(file_data_path + filename + ".tres")
	if !current_file_data:
		print("Error Failed To Load File Data")

func show_file_data(file : FileData):
	print("Title : ", file.Title)
	print("Description : " ,file.Description)
	print("Content : ", file.Content)

func edit_file_data(file : FileData, title : String, description : String, content : String):
	if !file:
		print("Error No File Data Supplied!")
	if file:
		file.Title = title
		file.Description = description
		file.Content = content

func save_file_data(file : FileData, filename : String):
	last_saved_time = 0
	ResourceSaver.save(file, file_data_path + filename + ".tres")

func new_file_data(name : String):
	current_file_name = name
	current_file_data = FileData.new()

#endregion








