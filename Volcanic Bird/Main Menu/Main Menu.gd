extends Control

var saveFilePath = "user://PlayerSave.tres"

var playerData = PlayerSave.new()

func _on_play_pressed():
	Global.itemInventory.clear()
	Global.itemStorage.clear()
	loadItemList()
	Global.eventCounter = 0
	Global.floorCounter = 0
	Global.totalEventsCompleted = 0
	get_tree().change_scene_to_file("res://Main Menu/StartScene.tscn")

# Simply for loading in sample creatures, not needed for final build
func setupSampleGroup():
	var samepleCreature1 = load("res://Creatures/Villager_F.tres")
	var samepleCreature2 = load("res://Creatures/Robirdo.tres")
	var samepleCreature3 = load("res://Creatures/Shroom.tres")
	var samepleCreature4 = load("res://Creatures/Wizard.tres")
	var dummyCreature = load("res://Creatures/Dummy.tres")
	
	var creature1 = Creatures.new()
	var creature2 = Creatures.new()
	var creature3 = Creatures.new()
	var creature4 = Creatures.new()
	
	creature1.initializeCreature(samepleCreature1)
	creature2.initializeCreature(samepleCreature2)
	creature3.initializeCreature(samepleCreature3)
	creature4.initializeCreature(samepleCreature4)
	
	Global.battleGroup[0] = creature1
	Global.battleGroup[1] = creature2
	Global.battleGroup[2] = creature3
	Global.battleGroup[3] = creature4
	
	for i in range(4):
		if Global.battleGroup[i] == null:
			Global.battleGroup[i] = dummyCreature
	
	var creature5 = Creatures.new()
	var creature6 = Creatures.new()
	var creature7 = Creatures.new()
	var creature8 = Creatures.new() 
	
	creature5.initializeCreature(samepleCreature1)
	creature6.initializeCreature(samepleCreature2)
	creature7.initializeCreature(samepleCreature3)
	creature8.initializeCreature(samepleCreature4)
	
	Global.creatureStorage.append(creature1)
	Global.creatureStorage.append(creature2)
	Global.creatureStorage.append(creature3)
	Global.creatureStorage.append(creature4)
	Global.creatureStorage.append(creature5)
	Global.creatureStorage.append(creature6)
	Global.creatureStorage.append(creature7)
	Global.creatureStorage.append(creature8)

func loadItemList():
	var arrayOfItems = ["res://Items/DeadlyPoison.tres", "res://Items/HealingFruit.tres", "res://Items/HealingPotion.tres", "res://Items/Steroid.tres", "res://Items/TreeBark.tres", "res://Items/TreeSap.tres", "res://Items/Type3.tres", "res://Items/Type4.tres", "res://Items/Type5.tres", "res://Items/Type6.tres", "res://Items/Type7.tres", "res://Items/Type8.tres"]
	var i = 0
	while i < arrayOfItems.size():
		print("Loading " + arrayOfItems[i])
		var currentItem = Item.new()
		var tempItem = load(arrayOfItems[i])
		currentItem.initializeItem(load(arrayOfItems[i]))
	# Add the current item to the master item list
		Global.itemsMaster.append(currentItem)
	# Add the current item to the common or rare item list
		if currentItem.itemRarity == 0:
			Global.commonItemsMaster.append(currentItem)
		elif currentItem.itemRarity == 1:
			Global.rareItemsMaster.append(currentItem)
		print(currentItem.nameLabel)
		print(tempItem.nameLabel)
		i += 1

func loadGame():
	loadItemList()
	playerData = ResourceLoader.load(saveFilePath)
	if playerData != null:
		Global.battleGroup = playerData.battleGroup
		Global.creatureStorage = playerData.creatureStorage
		Global.itemInventory = playerData.itemInventory
		Global.itemStorage = playerData.itemStorage
		Global.eventCounter = playerData.eventCounter
		Global.floorCounter = playerData.floorCounter
		Global.totalEventsCompleted = playerData.totalEventsCompleted
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")

func _on_exit_pressed():
	get_tree().quit()

func _on_load_pressed():
	loadGame()

func _on_manual_pressed():
	get_tree().change_scene_to_file("res://Main Menu/manual.tscn")
