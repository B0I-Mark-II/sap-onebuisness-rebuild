extends Resource
class_name TransactionData


#CUSTOMER DATA
@export var customer : CustomerData

#TRANSACTION DATA
@export var uuid : int
@export var date : String

#ITEMS
@export var products : Array[ProductData]

# MONEY
@export var total : float

# OPEN / CLOSED DOCO
@export var Completed : bool
