extends Button

@export var Item : Resource

func _ready():
	Global.connect("updateItems", updateSlot)
	updateSlot()
	
func updateSlot():
	if Item != null:
		self.text = str(Item.nameLabel)

func _on_pressed():
	Global.draggedItemInventory = Item
