extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_pressed():
	# Activate test
	var ds = MaxHeap.new(5);
	ds.insert(1, 5)
	ds.insert(5, 4)
	ds.insert(2, 3)
	ds.insert(4, 2)
	ds.insert(3, 1)
	# for x in range(5):
		# print(ds.extract_max())
	# print("Expected 1 5 2 4 3")
	
	# print("TESTING TURN QUEUE");
	
	# Creating a bunch of creatures with different speed values
	var creature1 = load("res://Creatures/Tree.tres");
	creature1.speed = 1
	creature1.name = "creature1"
	var creature2 = creature1.duplicate();
	creature2.speed = 2
	creature2.name = "creature2"
	var creature3 = creature1.duplicate();
	creature3.speed = 3
	creature3.name = "creature3"
	var creature4 = creature1.duplicate();
	creature4.speed = 4
	creature4.name = "creature4"
	var creature5 = creature1.duplicate();
	creature5.speed = 5
	creature5.name = "creature5"
	
	var tq = TurnQueue.new()
	tq.add_entity(creature1)
	tq.add_entity(creature2)
	tq.add_entity(creature3)
	tq.add_entity(creature4)
	tq.add_entity(creature5)
	var turns = tq.get_turn_order()
	# print("TURNS: ", turns)
	
	# for creature in turns:
		# print(creature.name)
