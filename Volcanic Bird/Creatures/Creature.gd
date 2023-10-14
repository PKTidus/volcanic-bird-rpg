extends Resource

class_name Creatures

# If accessed from a .tres file, we need to @export otherwise it will get deleted
# from the .tres file
@export var name : String
@export var description : String
@export var texture : Resource
@export var agility : float
@export var strength : float
@export var intelligence : float
@export var level : int
@export var experience : int
@export var max_hp : int # Strength
@export var max_mp : int # Intelligence
@export var cur_hp : int
@export var cur_mp : int
@export var attack_damage : int # Strength
@export var magic_attack_damage : int # Intelligence
@export var defense : int # Strength
@export var magic_defense : int # Intelligence
@export var speed : int # Agility
@export var STR_growth : int
@export var AGI_growth : int
@export var INT_growth : int
# TODO : List of Skills and when they unlock
@export var skillPreload : Array[String]
@export var skillList : Array[Resource]

func levelUp():
	agility += 5
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
	
func initializeCreature(sampleCreature):
	name = sampleCreature.name
	description = sampleCreature.description
	texture = sampleCreature.texture
	level = sampleCreature.level
	experience = sampleCreature.experience
	agility = sampleCreature.agility
	strength = sampleCreature.strength
	intelligence = sampleCreature.intelligence
	max_hp = sampleCreature.max_hp
	max_mp = sampleCreature.max_mp
	cur_hp = sampleCreature.cur_hp
	cur_mp = sampleCreature.cur_mp
	attack_damage = sampleCreature.attack_damage
	magic_attack_damage = sampleCreature.magic_attack_damage
	defense = sampleCreature.defense
	magic_defense = sampleCreature.magic_defense
	speed = sampleCreature.speed
	STR_growth = sampleCreature.STR_growth
	AGI_growth = sampleCreature.AGI_growth
	INT_growth = sampleCreature.INT_growth
	initializeSkills(sampleCreature)
	
func initializeSkills(sampleCreature):
	for skill in sampleCreature.skillPreload:
		var newSkill = load(skill)
		var newSkillMove = Skill.new()
		newSkillMove = initializeSkillsList(newSkill, newSkillMove)
		skillList.append(newSkillMove)
	
func initializeSkillsList(newSkill, newSkillMove):
	newSkillMove.hp_cost = newSkill.hp_cost
	newSkillMove.mp_cost = newSkill.mp_cost
	newSkillMove.damage_cal = newSkill.damage_cal
	newSkillMove.heal_cal = newSkill.heal_cal
	newSkillMove.buff_value = newSkill.buff_value
	newSkillMove.type = newSkill.type
	newSkillMove.nameLabel = newSkill.nameLabel
	newSkillMove.costLabel = newSkill.costLabel
	newSkillMove.descriptionLabel = newSkill.descriptionLabel
	return newSkillMove
	
func decreaseHealth(amount):
	cur_hp -= amount
