extends Node2D

@export var asset : Resource

var level
var health_points
var magic_points
var defense
var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	if asset != null:
		$"Enemy Container/Sprite".texture = asset


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
