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
	if skill.type == 0 or skill.type == -2 or skill.type == 4 or skill.type == 3:
		Global.friendlyOrNot = 0
	elif skill.type == 1 or skill.type == 2:
		Global.friendlyOrNot = 1
	Global.clickedSkill = skill
	print(Global.clickedSkill)
	Global.ringSkillSignal()
