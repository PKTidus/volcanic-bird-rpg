extends Node2D

class_name Enemy

@export var asset : Resource
@export var current_hp : int
@export var max_hp : int

var level
var health_points
var magic_points
var defense
var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	# Load the texture of the enemy
	if asset != null:
		$"Enemy Container/Sprite".texture = asset
	
	# Update health
	$"Enemy Container/Health Bar".value = current_hp
	$"Enemy Container/Health Bar".max_value = max_hp
	$"Enemy Container/Health Bar/Label".text = str(current_hp) + "/" + str(max_hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
