extends Button

signal updateBattleButton

@export var creatureData : Resource

func _ready():
	#self.group = Global.playerBattleGroup_buttongroup
	Global.connect("battleGroup_changed", onBattleGroupChange)
	self.connect("updateBattleButton", updateSlot)
	updateSlot()

func onBattleGroupChange():
	updateSlot()
	
func updateSlot():
	if creatureData != null:
		self.icon = creatureData.texture
		self.text = creatureData.name
	if creatureData == null:
		self.icon = null
		self.text = ""

func _on_BattleGroup_pressed():
	pass
