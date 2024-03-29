extends Resource

class_name Skill

@export var hp_cost : int
@export var mp_cost : int
@export var damage_cal : float
@export var heal_cal : int
@export var buff_value : float
@export var unlockLevel : int

# 0 = attack
# 1 = heal
# 2 = buff (positive value) / debuff (negative value)
@export var type : int

@export var nameLabel : String
@export var costLabel : String
@export var descriptionLabel : String

func initializeSkill(hp_cost, mp_cost, damage_cal, heal_cal, buff_value):
	self.hp_cost = hp_cost
	self.mp_cost = mp_cost
	self.damage_cal = damage_cal
	self.heal_cal = heal_cal
	self.buff_value = buff_value
