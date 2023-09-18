extends Node

signal battleGroup_changed

# @onready var playerBattleGroup_buttongroup = ButtonGroup.new()

# Player Items and Other needed details
var battleGroup = [null, null, null, null] # 4x null because of 4 creatures in group
var creatureStorage = ["res://Creatures/Tree.tres", "res://Creatures/Purple_Flower.tres"]
var itemInventory = [] 
var itemStorage = []

# Creature Parts For Creature Menu
var current_name
var current_description

# For moving stuff around
var draggedCreature
var draggedCreatureIndex = 0


func addToBattleGroup():
	print(draggedCreatureIndex)
	if battleGroup.has(draggedCreature) == true:
		if battleGroup.find(draggedCreature) != draggedCreatureIndex:
			battleGroup[battleGroup.find(draggedCreature)] = null
	battleGroup[draggedCreatureIndex] = draggedCreature
	emit_signal("battleGroup_changed")
	
func removeFromBattleGroup():
	pass
	
func addToCreatureSlot():
	pass

func removeFromCreatureSlot():
	pass
