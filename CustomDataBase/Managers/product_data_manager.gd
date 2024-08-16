extends Node
const LAPTOP = preload("res://Products/Laptop.tres")

var products : Array[ProductData]

func _ready():
	load_current_products()

func load_current_products():
	products.append(LAPTOP)

func search_by_uuid(uuid : int) -> ProductData:
	for product in products:
		if product.uuid == uuid:
			return product
	return null

func search_by_barcode(barcode : String) -> ProductData:
	for product in products:
		if product.barcode == barcode:
			return product
	return null
