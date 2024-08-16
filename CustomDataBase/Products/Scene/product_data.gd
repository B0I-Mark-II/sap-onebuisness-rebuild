extends Control
@onready var displayed_uuid = $Uuid_Countainer/Uuid
@onready var displayed_barcode = $Barcode_Countainer/Barcode
@onready var displayed_name = $Name_Countainer/Name
@onready var displayed_catagory = $Catagory_Countainer/Catagory
@onready var displayed_stock = $Stock_Countainer/Stock
@onready var displayed_cost = $Cost_Countainer/Cost

@onready var uuid_ui = $Uuid_Countainer/Uuid_Ui
@onready var name_ui = $Name_Countainer/Name_Ui
@onready var barcode_ui = $Barcode_Countainer/Barcode_Ui
@onready var cost_ui = $Cost_Countainer/Cost_Ui
@onready var catagory_ui = $Catagory_Countainer/Catagory_Ui
@onready var stock_ui = $Stock_Countainer/Stock_Ui


@onready var refresh_timer = $Refresh_Timer

var original_product_reference : ProductData # NON EDITABLE ORIGINAL REFERENCE

var displayed_product_data : ProductData # EDITABLE

var show_ui : bool = true

func show_product_data(data : ProductData):
	displayed_uuid.text = str(data.uuid)
	displayed_barcode.text = data.barcode
	displayed_name.text = data.Name
	displayed_catagory.text = data.Catagory
	displayed_stock.text = str(data.stock) + " : Stock Remaining"
	displayed_cost.text = "$" + str(data.Cost) #COST TO CONSUMER
	displayed_cost.editable = data.Discountable
	
	uuid_ui.visible = show_ui
	name_ui.visible = show_ui
	barcode_ui.visible = show_ui
	cost_ui.visible = show_ui
	catagory_ui.visible = show_ui
	stock_ui.visible = show_ui


func _on_refresh_timer_timeout():
	refresh_timer.start(120)
	refresh_product_data()

func refresh_product_data():
	show_product_data(original_product_reference)



func _on_uuid_text_submitted(new_text):
	original_product_reference =  ProductDataManager.search_by_uuid(int(new_text))
	displayed_product_data = original_product_reference
	if displayed_product_data:
		show_product_data(displayed_product_data)
	if !displayed_product_data:
		push_error("UUID NOT FOUND OR RETURNED NULL")


func _on_barcode_text_submitted(new_text):
	original_product_reference =  ProductDataManager.search_by_barcode(new_text)
	displayed_product_data = original_product_reference
	if displayed_product_data:
		show_product_data(displayed_product_data)
	if !displayed_product_data:
		push_error("BARCODE NOT FOUND OR RETURNED NULL")
