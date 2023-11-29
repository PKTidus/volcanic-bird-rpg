extends Node

signal battleGroup_changed
signal updateItems
signal skillObtained
signal itemObtained
signal updateItemManagementLabels

# Player Items and Other needed details
var battleGroup = [null, null, null, null] # 4x null because of 4 creatures in group
var creatureStorage = []
var itemInventory = [] 
var itemStorage = []
var eventCounter = 0
var floorCounter = 0
var eventCompleted = false
var eventThreshold = [10, 15, 25]
var totalEventsCompleted = 0

# 1 = Crowilla Ending
# 2 = Volcanic Bird Ending
var whichEnding = 0

var itemsMaster = []
var commonItemsMaster = []
var rareItemsMaster = []

# EVENTS
var selected_enemy_paths = []
var event: Event = null
var background
var usedEvents = {}

# Creature Parts For Creature Menu
var current_name
var current_description
var current_damage
var current_mp
var current_hp
var current_speed
var current_level
var current_magic_damage
var current_defense
var current_magic_defense
var current_magic_attack_damage
var current_texture
var current_skills

# For moving stuff around
var draggedCreature
var draggedCreatureIndex = 0

# For item management stuff
var current_item_name
var current_item_description
var current_item_label

var draggedItemInventory
var draggedItemIncentoryIndex = 0

var draggedItemStorage
var draggedItemStorageIndex = 0

var clickedItem
var clickedSkill
# 0 = not friendly
# 1 = friendly
var friendlyOrNot = 0

func ringSkillSignal():
	print("hiiiii")
	emit_signal("skillObtained")

func ringItemSignal():
	emit_signal("itemObtained")
	
func ringUpdateItemLabels():
	emit_signal("updateItemManagementLabels")

func addToBattleGroup():
	print(draggedCreatureIndex)
	if battleGroup.has(draggedCreature) == true:
		if battleGroup.find(draggedCreature) != draggedCreatureIndex:
			battleGroup[battleGroup.find(draggedCreature)] = load("res://Creatures/Dummy.tres")
	battleGroup[draggedCreatureIndex] = draggedCreature
	emit_signal("battleGroup_changed")
	emit_signal("battleGroup_changed")
	
func addToInventory():
	if itemInventory.size() >= 12:
		return
	if draggedItemStorage != null:
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
