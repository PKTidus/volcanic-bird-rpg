extends Button

@export var Item : Resource

func _ready():
	Global.connect("updateItems", updateSlot)
	updateSlot()
	
func updateSlot():
	if Item != null:
		self.text = str(Item.nameLabel)

func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		Global.current_item_name = Item.nameLabel
		Global.current_item_label = Item.costLabel
		Global.current_item_description = Item.descriptionLabel
		Global.ringUpdateItemLabels()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		Global.draggedItemInventory = Item
		Global.addToStorage()
