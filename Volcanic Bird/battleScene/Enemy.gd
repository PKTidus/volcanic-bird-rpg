extends Node2D

signal updateEnemy

@export var enemyData : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("updateEnemy", updateAsset)

func updateAsset():
	# Load the texture of the enemy
	if enemyData.asset == null:
		$"Enemy Container".hide()
		enemyData.isDead = true
	if enemyData.asset != null:
		$"Enemy Container/Sprite".texture = enemyData.asset
	updateHealth()

func updateHealth():
	# Update current and max HP
	$"Enemy Container/Health Bar".value = enemyData.current_hp
	$"Enemy Container/Health Bar".max_value = enemyData.max_hp
	
	# Prevent a negative current HP and remove the enemy
	if enemyData.current_hp <= 0:
		enemyData.current_hp = 0
		enemyData.isDead = true
		$"Enemy Container".hide()
	
	# Update label
	$"Enemy Container/Health Bar/Label".text = str(enemyData.current_hp) + "/" + str(enemyData.max_hp)
