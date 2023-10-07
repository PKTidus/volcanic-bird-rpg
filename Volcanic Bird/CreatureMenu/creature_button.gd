extends Button

signal creatureSlotFocus

@export var creatureData : Resource

func _ready():
	#self.group = Global.playerBattleGroup_buttongroup
	Global.connect("battleGroup_changed", onInventoryChange)
	equippedMarker()
	updateSlot()

func onInventoryChange():
	equippedMarker()
	updateSlot()

func equippedMarker():
	if Global.battleGroup.has(creatureData):
		$EquippedMarker.visible = true
	else:
		$EquippedMarker.visible = false

func updateSlot():
	if creatureData != null:
		self.icon = creatureData.texture
		self.text = str(creatureData.name)

func _on_focus_entered():
	if creatureData != null:
		Global.current_description = creatureData.description
		Global.current_name = creatureData.name
	emit_signal("creatureSlotFocus")

func _on_pressed():
	Global.draggedCreature = creatureData
