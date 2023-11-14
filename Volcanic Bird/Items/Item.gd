extends Resource

class_name Item

# Type is used to define what kind of item it is.
# 0 = Consumable, 1 = Modifier, 2 = Attack
var type : int
var modify_strength : int
var modify_agility: int
var modify_intelligence : int
var mp_heal : int
var hp_heal : int
var damage : int
var nameLabel : String
var costLabel : String
var descriptionLabel : String
var inUse : bool

func initializeItem(item):
	type = item.type
	modify_strength = item.modify_strength
	modify_agility = item.modify_agility
	modify_intelligence = item.modify_intelligence
	mp_heal = item.mp_heal
	hp_heal = item.hp_heal
	damage = item.damage
	nameLabel = item.nameLabel
	costLabel = item.costLabel
	descriptionLabel = item.descriptionLabel
	inUse = item.inUse
