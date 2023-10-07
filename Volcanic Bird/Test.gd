extends Control

var myCreature = load("res://Creatures/Tree.tres")

func _ready():	
	var myMoves = Moves.new()
	
	myMoves.creature = myCreature
	myMoves.move = 2
	print(myCreature.max_hp)
	print(myMoves.creature.agility)
	myCreature.levelUp()
	print(myCreature.max_hp)
	print(myMoves.creature.max_hp)
	
