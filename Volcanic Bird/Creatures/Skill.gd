extends Node

var hp_cost : int
var mp_cost : int
var damage_cal : int
var heal_cal : int
var target_ally : bool
var target_enemy : bool
var buff_value : int

# 0 = attack
# 1 = heal
# 2 = buff (positive value) / debuff (negative value)
var type : int
