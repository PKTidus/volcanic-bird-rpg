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
