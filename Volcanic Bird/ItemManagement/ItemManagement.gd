extends Panel

func _ready():
	Global.connect("updateItems", instanceSlots)
	instanceSlots()
	
func instanceSlots():
	for node in $InventoryContainer/VBoxContainer.get_children():
		node.queue_free()
		
	for node in $StorageContainer/VBoxContainer.get_children():
		node.queue_free()
		
	for inventoryIndex in Global.itemInventory.size():
		var inventorySlot = load("res://ItemManagement/ItemButton.tscn")
		var newInventorySlot = inventorySlot.instantiate()
		
		if Global.itemInventory[inventoryIndex] is Object:
			newInventorySlot.Item = Global.itemInventory[inventoryIndex]
			
		$InventoryContainer/VBoxContainer.add_child(newInventorySlot)
		
	for storageIndex in Global.itemStorage.size():
		var storageSlot = load("res://ItemManagement/StorageItem.tscn")
		var newStorageSlot = storageSlot.instantiate()
		
		if Global.itemStorage[storageIndex] is Object:
			newStorageSlot.Item = Global.itemStorage[storageIndex]
			
		$StorageContainer/VBoxContainer.add_child(newStorageSlot)


func _on_add_to_storage_pressed():
	Global.addToStorage()
	
func _on_add_to_inventory_pressed():
	Global.addToInventory()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
