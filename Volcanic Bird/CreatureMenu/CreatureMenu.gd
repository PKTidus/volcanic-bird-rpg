extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("battleGroup_changed", battleGroupChanged)
	hideNameChange()
	instanceInventorySlots()
	loadInBattleGroup()

func hideNameChange():
	$"Creature Name".hide()
	$NameButton.hide()

func showNameChange():
	$"Creature Name".show()
	$NameButton.show()

func battleGroupChanged():
	instanceInventorySlots()

func loadInBattleGroup():
	var battleGroupIndex = 0
	for node in $BattleGroup.get_children():
		node.creatureData = Global.battleGroup[battleGroupIndex]
		battleGroupIndex += 1
		node.emit_signal("updateBattleButton")

func instanceInventorySlots():
	# Removing current nodes in storage
	for node in $Characters/VBoxContainer.get_children():
		node.queue_free()
	# Instance Current Creature Slots
	for itemIndex in Global.creatureStorage.size():
		var creatureSlot = load("res://CreatureMenu/creature_button.tscn")
		var newCreatureSlot = creatureSlot.instantiate()
		newCreatureSlot.creatureData = Global.creatureStorage[itemIndex]
		$Characters/VBoxContainer.add_child(newCreatureSlot)
		newCreatureSlot.connect("creatureSlotFocus", onCreatureSlotFocus)

func onCreatureSlotFocus():
	$Name.text = "Name = " + str(Global.current_name)
	$Description.text = str(Global.current_description)
	$Stats/AttackDamage.text = "Attack Damage = " + str(Global.current_damage)
	$Stats/CurHP.text = "Current HP = " + str(Global.current_hp)
	$Stats/CurMP.text = "Current MP = " + str(Global.current_mp)
	$Stats/Speed.text = "Speed = " + str(Global.current_speed)
	$Stats/Level.text = "Level = " + str(Global.current_level)
	$"Stats/Magic Attack Damage".text = "Magic Attack Damage = " + str(Global.current_magic_damage)
	$"Stats/Magic Defense".text = "Magic Defense = " + str(Global.current_magic_defense)
	$Stats/Defense.text = "Defense = " + str(Global.current_defense)
	$CurrentlyCarrying.text = "Currently Carrying = " + str(Global.current_name)
	showNameChange()

func _on_button_pressed():
	Global.draggedCreature = null
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")

func _on_name_button_pressed():
	if Global.draggedCreature != null:
		var newName = $"Creature Name".text
		print(newName)
		Global.draggedCreature.name = newName
		$"Creature Name".clear()
		instanceInventorySlots()
		loadInBattleGroup()
		$Name.text = "Name = " + str(newName)
