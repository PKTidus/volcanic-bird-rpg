extends Resource

class_name Creatures

# If accessed from a .tres file, we need to @export otherwise it will get deleted
# from the .tres file
@export var name : String
@export var description : String
@export var texture : Resource
@export var level : int
@export var experience : int
@export var agility : float
@export var strength : float
@export var intelligence : float
@export var max_hp : int # Strength
@export var max_mp : int # Intelligence
@export var cur_hp : int # Strength
@export var cur_mp : int # Intelligence
@export var attack_damage : int # Strength
@export var magic_attack_damage : int # Intelligence
@export var defense : int # Strength
@export var magic_defense : int # Intelligence
@export var speed : int # Agility
@export var STR_growth : int
@export var AGI_growth : int
@export var INT_growth : int
# @export var luck : int
var cur_move
# TODO : List of Skills and when they unlock

func levelUp():
	agility += AGI_growth
	strength += 5
	intelligence += 5
	modifyStrength(5)
	modifyIntelligence(5)
	modifyAgility(5)
	
func modifyStrength(value : int):
	attack_damage += value
	max_hp += value
	defense += value

func modifyAgility(value : int):
	speed += value

func modifyIntelligence(value : int):
	magic_attack_damage += value
	magic_defense += value
	max_mp += value
