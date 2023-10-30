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
		Global.current_damage = str(creatureData.attack_damage)
		Global.current_hp = str(creatureData.cur_hp) + "/" + str(creatureData.max_hp)
		Global.current_mp = str(creatureData.cur_mp) + "/" + str(creatureData.max_mp)
		Global.current_speed = str(creatureData.speed)
		Global.current_level = str(creatureData.level)
	emit_signal("creatureSlotFocus")

func _on_pressed():
	Global.draggedCreature = creatureData
