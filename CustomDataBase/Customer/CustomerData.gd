extends Resource
class_name CustomerData

#NEED TO BE ABLE TO INDEX THESE IN DATABASE FAST
 
@export var Customer_Name : String # NAME OF CUSTOMER
@export var Billing_Name : String # AKA INVOICING / BILLING NAME


@export var Primary_Phone_Number : int
@export var Secondary_Phone_Number : int

@export var customer_email_contact : String # aka Contact/Admin@buisness.com
@export var customer_email_billing : String # aka Accounts@buisness.com

@export var Billing_Address : String
@export var Shipping_Address : String


#TODO
@export var Customer_Transactions : Array[TransactionData]
