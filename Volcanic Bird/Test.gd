extends Control

var myCreature = load("res://Creatures/Tree.tres")

func _ready():	
	var myMoves = Moves.new()
	var myCreature2 = Creatures.new()
	
	myCreature2.name = "Pidro"
	
	myMoves.creature = myCreature
	myMoves.move = 2
	myCreature.levelUp()
	print(myCreature.speed)
	print(myMoves.creature.speed)
	print(myCreature2.name)
	
