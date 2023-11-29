extends Resource

class_name EnemyData

@export var enemy_name : String
@export var asset : Resource
@export var damage : int
@export var magic_damage : int
@export var current_hp : int
@export var max_hp : int
@export var level : int
@export var health_points : int
@export var magic_points : int
@export var defense : float
@export var magic_defense : float
@export var speed : int
@export var isDead : bool
@export var useMagic : bool
@export var experience : int

# i hate my life
func THROWITINTHEJAR(value : float):
	value = value * 0.1 + 1 # holy fuck
	damage = ceil(float(damage) * value)
	magic_damage = ceil(float(magic_damage) * value)
	max_hp = ceil(float(max_hp) * value)
	current_hp = ceil(float(current_hp) * value)
	speed = ceil(float(speed) * value)
	defense = ceil(float(defense) * value)
	magic_defense = ceil(float(magic_defense) * value)
	experience = ceil(float(experience) * value)

func initializeEnemyData(enemy):
	enemy_name = enemy.enemy_name
	asset = enemy.asset
	damage = enemy.damage
	magic_damage = enemy.magic_damage
	current_hp = enemy.current_hp
	max_hp = enemy.max_hp
	level = enemy.level
	health_points = enemy.health_points
	magic_points = enemy.magic_points
	defense = enemy.defense
	magic_defense = enemy.magic_defense
	speed = enemy.speed
	experience = enemy.experience
