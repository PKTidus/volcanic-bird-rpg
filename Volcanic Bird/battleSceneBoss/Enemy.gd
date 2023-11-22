extends Node2D

signal updateEnemy

@export var enemyBoss : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("updateEnemy", updateAsset)

func updateAsset():
	# Load the texture of the enemy
	if enemyBoss.asset != null:
		$"Enemy Container/Sprite".texture = enemyBoss.asset
	updateHealth()

func updateHealth():
	# Update current and max HP
	$"Enemy Container/Health Bar".value = enemyBoss.current_hp
	$"Enemy Container/Health Bar".max_value = enemyBoss.max_hp
	
	# Prevent a negative current HP and remove the enemy
	if enemyBoss.current_hp <= 0:
		enemyBoss.current_hp = 0
		enemyBoss.isDead = true
		$"Enemy Container".hide()
	
	# Update label
	$"Enemy Container/Health Bar/Label".text = str(enemyBoss.current_hp) + "/" + str(enemyBoss.max_hp)
