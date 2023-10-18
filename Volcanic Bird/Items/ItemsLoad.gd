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
	

func _on_button_pressed():
	if Item.type == 2:
		Global.friendlyOrNot = 0
	elif Item.type == 0 or Item.type == 1:
		Global.friendlyOrNot = 1
	Global.clickedItem = Item
	Global.ringItemSignal()
