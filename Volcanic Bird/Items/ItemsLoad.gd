extends Node2D

signal updateItemButton

@export var Item : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("updateItemButton", updateItem)

func updateItem():
	$Button/Name.text = Item.nameLabel
	$Button/Cost.text = Item.costLabel
	$Button/Description.text = Item.descriptionLabel

