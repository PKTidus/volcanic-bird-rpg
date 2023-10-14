extends Resource

class_name Enemy

@export var enemy_name : String
@export var asset : Resource
@export var current_hp : int
@export var max_hp : int
@export var level : int
@export var health_points : int
@export var magic_points : int
@export var defense : int
@export var speed : int

func initializeEnemyData(enemy):
	enemy_name = enemy.enemy_name
	asset = enemy.asset
	current_hp = enemy.current_hp
	max_hp = enemy.max_hp
	level = enemy.level
	health_points = enemy.health_points
	magic_points = enemy.magic_points
	defense = enemy.defense
	speed = enemy.speed
