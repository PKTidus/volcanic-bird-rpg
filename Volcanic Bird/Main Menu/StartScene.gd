extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_option_a_pressed():
	clearBattleGroup()
	Global.creatureStorage.clear()
	var samepleCreature1 = load("res://Creatures/Joey.tres")
	var samepleCreature2 = load("res://Creatures/Funky_Frog.tres")
	var samepleCreature3 = load("res://Creatures/Table.tres")
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
	
	Global.creatureStorage.append(creature1)
	Global.creatureStorage.append(creature2)
	Global.creatureStorage.append(creature3)
	Global.creatureStorage.append(creature4)
	
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")

func clearBattleGroup():
	for i in range(4):
		Global.battleGroup[i] = null

func _on_option_b_pressed():
	clearBattleGroup()
	Global.creatureStorage.clear()
	var samepleCreature1 = load("res://Creatures/Robirdo.tres")
	var samepleCreature2 = load("res://Creatures/Crowilla.tres")
	var samepleCreature3 = load("res://Creatures/Penguin.tres")
	var samepleCreature4 = load("res://Creatures/USB_Micro.tres")
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
	
	Global.creatureStorage.append(creature1)
	Global.creatureStorage.append(creature2)
	Global.creatureStorage.append(creature3)
	Global.creatureStorage.append(creature4)
	
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")

func _on_option_c_pressed():
	clearBattleGroup()
	Global.creatureStorage.clear()
	var samepleCreature1 = load("res://Creatures/Shroom.tres")
	var samepleCreature2 = load("res://Creatures/Dizzy_Mug.tres")
	var samepleCreature3 = load("res://Creatures/Phone.tres")
	var samepleCreature4 = load("res://Creatures/Shroom.tres")
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
	
	Global.creatureStorage.append(creature1)
	Global.creatureStorage.append(creature2)
	Global.creatureStorage.append(creature3)
	Global.creatureStorage.append(creature4)
	
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")


func _on_event_music_finished():
	$"Event Music".play()
