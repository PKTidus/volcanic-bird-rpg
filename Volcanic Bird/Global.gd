extends Node

signal battleGroup_changed
signal updateItems

# Player Items and Other needed details
var battleGroup = [null, null, null, null] # 4x null because of 4 creatures in group
var creatureStorage = ["res://Creatures/Tree.tres", "res://Creatures/Purple_Flower.tres"]
var itemInventory = ["res://Creatures/Tree.tres"] 
var itemStorage = ["res://Creatures/Purple_Flower.tres"]

# Creature Parts For Creature Menu
var current_name
var current_description

# For moving stuff around
var draggedCreature
var draggedCreatureIndex = 0

var draggedItemInventory
var draggedItemIncentoryIndex = 0

var draggedItemStorage
var draggedItemStorageIndex = 0


func addToBattleGroup():
	print(draggedCreatureIndex)
	if battleGroup.has(draggedCreature) == true:
		if battleGroup.find(draggedCreature) != draggedCreatureIndex:
			battleGroup[battleGroup.find(draggedCreature)] = null
	battleGroup[draggedCreatureIndex] = draggedCreature
	emit_signal("battleGroup_changed")
	
func addToInventory():
	print("1")
	if draggedItemStorage != null:
		print("2")
		itemInventory.append(draggedItemStorage)
		itemStorage.erase(draggedItemStorage)
		draggedItemStorage = null
	emit_signal("updateItems")

func addToStorage():
	if draggedItemInventory != null:
		itemStorage.append(draggedItemInventory)
		itemInventory.erase(draggedItemInventory)
		draggedItemInventory = null
	emit_signal("updateItems")
	
func removeFromBattleGroup():
	pass
	
func addToCreatureSlot():
	pass

func removeFromCreatureSlot():
	pass
