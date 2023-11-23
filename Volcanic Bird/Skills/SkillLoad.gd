extends Node2D

signal updateSkillButton

@export var skill : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("updateSkillButton", updateSkill)

func updateSkill():
	$Button/Name.text = skill.nameLabel
	$Button/Cost.text = skill.costLabel
	$Button/Description.text = skill.descriptionLabel

func _on_button_pressed():
	# This is for skills that effect enemies
	if skill.type == 0 or skill.type == -2 or skill.type == 4 or skill.type == 3 or skill.type == 5 or skill.type == 6 or skill.type == 7 or skill.type == 8 or skill.type == -10 or skill.type == -11 or skill.type == 12 or skill.type == 13 or skill.type == 14 or skill.type == 15 or skill.type == 16:
		Global.friendlyOrNot = 0
	# This is for skills that effect allies
	# 1 2 9 10 11 
	elif skill.type == 1 or skill.type == 2 or skill.type == 9 or skill.type == 10 or skill.type == 11:
		Global.friendlyOrNot = 1
	Global.clickedSkill = skill
	print(Global.clickedSkill)
	Global.ringSkillSignal()
