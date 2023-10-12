# TURN QUEUE USAGE
# put in objects that have a .speed property
# get out a list of those objects sorted by speed

class_name TurnQueue

const MAX_SIZE = 8

var size = 0
var _entities = []
var _heap: MaxHeap

func _init():
	self._heap = MaxHeap.new(MAX_SIZE)

func add_entity(entity):
	if self.size == MAX_SIZE:
		print("CANNOT ADD MORE THAN 8 ENEMIES TO TURN QUEUE")
		return
	self._entities.append(entity)
	self.size += 1
	
func get_turn_order():
	# Put everything in the max heap
	for index in self.size:
		self._heap.insert(index, _entities[index].speed)
	
	# Pull everything out
	var turn_order = []
	for x in self.size:
		var index = self._heap.extract_max()
		turn_order.append(self._entities[index])

	return turn_order
