extends Control

var saveFilePath = "user://PlayerSave.tres"

var playerData = PlayerSave.new()

func _on_play_pressed():
	setupSampleGroup()
	loadSampleItem()
	loadItemList()
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")

# Simply for loading in sample creatures, not needed for final build
func setupSampleGroup():
	var samepleCreature1 = load("res://Creatures/Purple_Flower.tres")
	var samepleCreature2 = load("res://Creatures/Purple_Flower.tres")
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
	
func loadSampleItem():
	var tempItem = Item.new()
	var sampleItem = load("res://Items/HealingPotion.tres")
	tempItem.initializeItem(sampleItem)
	Global.itemInventory.append(tempItem)
	
	var tempItem2 = Item.new()
	var sampleItem2 = load("res://Items/Steroid.tres")
	tempItem2.initializeItem(sampleItem2)
	Global.itemInventory.append(tempItem2)
	
	var tempItem3 = Item.new()
	var sampleItem3 = load("res://Items/DeadlyPoison.tres")
	tempItem3.initializeItem(sampleItem3)
	Global.itemInventory.append(tempItem3)
	
	for i in range(15):
		var tempItem4 = Item.new()
		tempItem4.initializeItem(sampleItem)
		Global.itemStorage.append(tempItem4)
	
	var tempItem5 = Item.new()
	tempItem5.initializeItem(sampleItem2)
	Global.itemStorage.append(tempItem5)
	
	var tempItem6 = Item.new()
	tempItem6.initializeItem(sampleItem3)
	Global.itemStorage.append(tempItem6)

func loadItemList():
	var dir = DirAccess.open("res://Items/")
	if dir:
		dir.list_dir_begin()
		var fileName = dir.get_next()
		while fileName != "":
			if fileName.ends_with(".tres"):
				print("Found Item: " + dir.get_current_dir() + "/" + fileName)
				var currentItemPath = dir.get_current_dir() + "/" + fileName
				var currentItem = Item.new()
				currentItem.initializeItem(load(currentItemPath))
				
				# Add the current item to the master item list
				Global.itemsMaster.append(currentItem)
				
				# Add the current item to the common or rare item list
				if currentItem.itemRarity == 0:
					Global.commonItemsMaster.append(currentItem)
				elif currentItem.itemRarity == 1:
					Global.rareItemsMaster.append(currentItem)
			fileName = dir.get_next()
	else:
		print("Could not load \"res://Items/\"")

func loadGame():
	playerData = ResourceLoader.load(saveFilePath)
	if playerData != null:
		Global.battleGroup = playerData.battleGroup
		Global.creatureStorage = playerData.creatureStorage
		Global.itemInventory = playerData.itemInventory
		Global.itemStorage = playerData.itemStorage
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")

func _on_options_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()

func _on_load_pressed():
	loadGame()
