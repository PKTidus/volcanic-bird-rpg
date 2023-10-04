extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("battleGroup_changed", battleGroupChanged)
	instanceInventorySlots()

func battleGroupChanged():
	instanceInventorySlots()

func instanceInventorySlots():
	# Removing current nodes in storage
	for node in $Characters/VBoxContainer.get_children():
		node.queue_free()
	# Instance Current Creature Slots
	for itemIndex in Global.creatureStorage.size():
		var creatureSlot = load("res://CreatureMenu/creature_button.tscn")
		var newCreatureSlot = creatureSlot.instantiate()
		newCreatureSlot.creatureData = load(Global.creatureStorage[itemIndex])
		$Characters/VBoxContainer.add_child(newCreatureSlot)
		newCreatureSlot.connect("creatureSlotFocus", onCreatureSlotFocus)
func onCreatureSlotFocus():
	$Name.text = str(Global.current_name)
	$Description.text = str(Global.current_description)
	
