extends Node

var customers : Array[CustomerData]

func _ready():
	load_saved_customer_data()

func load_saved_customer_data():
	#FUCK ILL DO THIS SHIT LATER
	pass



func search_by_name(name : String) -> Array[CustomerData]:
	var results : Array[CustomerData] = []
	for customer in customers:
		if customer.Billing_Name == name:
			results.append(customer)
		if customer.Customer_Name == name:
			results.append(customer)
	return results

func search_by_phone(phone_number : int) -> Array[CustomerData]:
	var results : Array[CustomerData] = []
	for customer in customers:
		if customer.Primary_Phone_Number == phone_number and !results.has(customer):
			results.append(customer)
		if customer.Secondary_Phone_Number == phone_number and !results.has(customer):
			results.append(customer)
	return results
