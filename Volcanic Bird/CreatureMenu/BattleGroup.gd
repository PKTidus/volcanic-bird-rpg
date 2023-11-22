extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("battleGroup_changed", onBattleGroupChanged)
	fillBattleGroupSlots()
	
func onBattleGroupChanged():
	fillBattleGroupSlots()
	
func fillBattleGroupSlots():
	$BattleGroupButton.creatureData = Global.battleGroup[0]
	$BattleGroupButton2.creatureData = Global.battleGroup[1]
	$BattleGroupButton3.creatureData = Global.battleGroup[2]
	$BattleGroupButton4.creatureData = Global.battleGroup[3]

func _on_battle_group_button_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !(Global.draggedCreature == null):
			Global.draggedCreatureIndex = 0
			Global.addToBattleGroup()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		Global.draggedCreature = load("res://Creatures/Dummy.tres")
		Global.draggedCreatureIndex = 0
		Global.addToBattleGroup()

func _on_battle_group_button_2_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !(Global.draggedCreature == null):
			Global.draggedCreatureIndex = 1
			Global.addToBattleGroup()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		Global.draggedCreature = load("res://Creatures/Dummy.tres")
		Global.draggedCreatureIndex = 1
		Global.addToBattleGroup()

func _on_battle_group_button_3_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !(Global.draggedCreature == null):
			Global.draggedCreatureIndex = 2
			Global.addToBattleGroup()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		Global.draggedCreature = load("res://Creatures/Dummy.tres")
		Global.draggedCreatureIndex = 2
		Global.addToBattleGroup()

func _on_battle_group_button_4_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !(Global.draggedCreature == null):
			Global.draggedCreatureIndex = 3
			Global.addToBattleGroup()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		Global.draggedCreature = load("res://Creatures/Dummy.tres")
		Global.draggedCreatureIndex = 3
		Global.addToBattleGroup()
