extends Button

signal battleButtonFocus

@export var creatureData : Resource

func _ready():
	updateSlot()
	
func updateSlot():
	if creatureData != null:
		self.icon = creatureData.texture
		self.name = str(creatureData.name)
	if creatureData == null:
		self.icon = null
		self.name = ""

func _on_focus_entered():
	if creatureData != null:
		Global.current_description = creatureData.description
		Global.current_name = creatureData.name
	if creatureData == null:
		Global.current_description = "None"
		Global.current_name = "None"
	updateSlot()
	emit_signal("battleButtonFocus")
