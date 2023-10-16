extends Resource

class_name Skill

@export var hp_cost : int
@export var mp_cost : int
@export var damage_cal : int
@export var heal_cal : int
@export var buff_value : int

# 0 = attack
# 1 = heal
# 2 = buff (positive value) / debuff (negative value)
@export var type : int

@export var nameLabel : String
@export var costLabel : String
@export var descriptionLabel : String
