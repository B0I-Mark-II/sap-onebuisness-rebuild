extends Resource
class_name ProductData

@export var Name : String
@export var Catagory : String # add search By Catagory Method & add scrollbar to display
#@export var Description : String # cant be fucked to add atm
#@export var image : Texture # " "

 
@export var uuid : int # CC
@export var barcode : String # UPC

@export var Cost : float # INC GST.
var Cost_Excluding_Gst : float # NON GST INCLUSIVE
@export var Discountable : bool

@export var stock : int # STOCK IN WAREHOUSE
