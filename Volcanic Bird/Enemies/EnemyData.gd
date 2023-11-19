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
@export var defense : int
@export var speed : int
@export var isDead : bool
@export var useMagic : bool

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
	speed = enemy.speed
