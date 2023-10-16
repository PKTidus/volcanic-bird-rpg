extends Control

var myCreature = load("res://Creatures/Tree.tres")
var myEnemy = load("res://Creatures/Tree.tres")

func _ready():
	var myMoves = Moves.new()
	print(myEnemy.level)
