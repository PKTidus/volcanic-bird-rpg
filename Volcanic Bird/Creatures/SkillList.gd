extends Node

class_name SkillList

var brap = Skill.new()
var heavySmash = Skill.new()
var heal = Skill.new()
var buff = Skill.new()
var debuff = Skill.new()

func initializeSkills():
	brap.initializeSkill(0, 1, 5, 0, 0)
	heavySmash.initializeSkill(5, 0, 3, 0, 0)
	heal.initializeSkill(0, 3, 0, 2, 1)
	buff.initializeSkill(0, 1, 0, 0, 2)
	debuff.initializeSkill(0, 1, 0, 0, -2)

func getSkillList():
	return {
		"Brap": brap,
		"Heavy Smash": heavySmash,
		"Heal": heal,
		"Buff": buff,
		"Debuff": debuff,
	}

func printSkillList():
	var skillList = getSkillList()
	
	for skill in skillList:
		print(skill)
