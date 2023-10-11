extends Button

signal updateButtons

@export var creatureData : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("updateButtons", updateButton)

func updateButton():
	$"Name".text = creatureData.name
	$"HPNumber".text = str(creatureData.cur_hp) + "/" + str(creatureData.max_hp)
	$"MPNumber".text = str(creatureData.cur_mp) + "/" + str(creatureData.max_mp)

func decreaseHealth(amount):
	creatureData.cur_hp -= amount
	$"HPNumber".text = str(creatureData.cur_hp) + "/" + str(creatureData.max_hp)
