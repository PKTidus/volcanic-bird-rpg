extends Resource

class_name Item

enum RARITY {Common, Rare}

# Type is used to define what kind of item it is.
# 0 = Consumable, 1 = Modifier, 2 = Attack
@export var type : int
@export var modify_attack: float
@export var modify_magic_attack: float
@export var modify_defense : float
@export var modify_magic_defense : float
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
	modify_defense = item.modify_defense
	modify_attack = item.modify_attack
	mp_heal = item.mp_heal
	hp_heal = item.hp_heal
	damage = item.damage
	nameLabel = item.nameLabel
	costLabel = item.costLabel
	descriptionLabel = item.descriptionLabel
	inUse = item.inUse
	itemRarity = item.itemRarity
