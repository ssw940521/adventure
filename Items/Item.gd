extends Resource
class_name Item

@export var name : String
@export_multiline var description : String
@export var amount := 1 : set = set_amount
@export var overworld_sprite : Texture

func set_amount(value : int) -> void :
	amount = max(0, value)
