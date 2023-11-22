extends Resource

class_name Item

enum RARITY {Common, Rare}

# Type is used to define what kind of item it is.
# 0 = Consumable, 1 = Modifier, 2 = Attack
@export var type : int
@export var modify_strength : int
@export var modify_agility: int
@export var modify_intelligence : int
@export var mp_heal : int
@export var hp_heal : int
@export var damage : int
@export var nameLabel : String
@export var costLabel : String
@export var descriptionLabel : String
@export var inUse : bool
@export var itemRarity = RARITY.Common

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
	itemRarity = item.itemRarity
