extends Control

@onready var transaction_date = $Transaction_Date
@onready var products_countainer = $Transaction_Product_Countainer/Product_Scroll/Products_Countainer

func _ready():
	autofill_date()

func autofill_date():
	var current_date = Time.get_date_string_from_system(false)
	var date_array = current_date.rsplit("-")
	
	#TRUSTS CLIENT AND GETS DATE INFO FROM SYSTEM
	transaction_date.text = (date_array[2] + "/" + date_array[1] + "/" + date_array[0])

func refresh_all_products():
	for product in products_countainer.get_children():
		product.refresh_product_data()
