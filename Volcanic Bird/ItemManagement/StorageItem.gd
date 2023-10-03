extends Button

@export var creatureData : Resource

func _ready():
	Global.connect("updateItems", updateSlot)
	updateSlot()
	
func updateSlot():
	if creatureData != null:
		self.icon = creatureData.texture
		self.text = str(creatureData.name)

func _on_pressed():
	Global.draggedItemStorage = creatureData
