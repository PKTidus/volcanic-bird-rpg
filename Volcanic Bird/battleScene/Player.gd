extends Node2D

@export var player_name : String
@export var hp : int
@export var mp : int

var level
var experience
var defense
var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/Player Name".text = player_name
	$"VBoxContainer/HP MP Container/HP".text = str(hp)
	$"VBoxContainer/HP MP Container/MP".text = str(mp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
