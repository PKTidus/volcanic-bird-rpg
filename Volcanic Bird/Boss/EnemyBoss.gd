extends Resource

class_name enemyBoss

@export var enemy_name : String
@export var asset : Resource
@export var current_hp : int
@export var max_hp : int
@export var health_points : int
@export var magic_points : int
@export var defense : int
@export var magic_defense : int
@export var speed : int
@export var isDead : bool
@export var moveSetPreload : Array[String]
@export var moveSetArray : Array [Resource]

func initializeEnemyBoss(boss):
	enemy_name = boss.enemy_name
	asset = boss.asset
	current_hp = boss.current_hp
	max_hp = boss.max_hp
	health_points = boss.health_points
	magic_points = boss.magic_points
	defense = boss.defense
	magic_defense = boss.magic_defense
	speed = boss.speed
	initializeSkills(boss)

func initializeSkills(boss):
	for moveSet in boss.moveSetPreload:
		var newMoveSet = load(moveSet)
		var newMoveSetMove = MoveSet.new()
		newMoveSetMove = initializeSkillsList(newMoveSet, newMoveSetMove)
		moveSetArray.append(newMoveSetMove)
	
func initializeSkillsList(newSkill, newSkillMove):
	newSkillMove.damage_cal = newSkill.damage_cal
	newSkillMove.type = newSkill.type
	newSkillMove.nameLabel = newSkill.nameLabel
	return newSkillMove
