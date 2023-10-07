extends Node2D

class_name Enemy

@export var enemy_name : String
@export var asset : Resource
@export var cur_hp : int
@export var max_hp : int
@export var level : int
@export var health_points : int
@export var magic_points : int
@export var defense : int
@export var speed : int

# Called when the node enters the scene tree for the first time.
func _ready():
	# Load the texture of the enemy
	if asset != null:
		$"Enemy Container/Sprite".texture = asset
	
	updateHealth()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateHealth():
	# Update current and max HP
	$"Enemy Container/Health Bar".value = cur_hp
	$"Enemy Container/Health Bar".max_value = max_hp
	
	# Prevent a negative current HP and remove the enemy
	if cur_hp <= 0:
		cur_hp = 0
		queue_free()
	
	# Update label
	$"Enemy Container/Health Bar/Label".text = str(cur_hp) + "/" + str(max_hp)
