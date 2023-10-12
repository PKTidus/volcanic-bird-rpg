class_name MaxHeap

# NOTE: NO KEY CAN EVER BE 0, TALK TO TOM IF THIS IS A PROBLEM <3

var max_size
var size = 0
var heap = []
var front = 0

func _init(max_size):
	self.max_size = max_size
	
	# Initalize array to 0
	for x in range(max_size):
		heap.append(Vector2(-1, 0))

func parent(index):
	return index / 2
	
func leftChild(index):
	return 2*index

func rightChild(index):
	return (2*index) + 1

func isLeaf(index):
	if index >= (floor(self.size/2)) and index <= self.size:
		return true
	return false
	
func swap(fpos, spos):
	var temp = heap[fpos]
	heap[fpos] = heap[spos]
	heap[spos] = temp
	
func maxHeapify(pos):
	if not self.isLeaf(pos):
		if (self.heap[pos].y < self.heap[self.leftChild(pos)].y or self.heap[pos].y < self.heap[self.rightChild(pos)].y):
			if (self.heap[self.leftChild(pos)].y > self.heap[self.rightChild(pos)].y):
				self.swap(pos, self.leftChild(pos))
				self.maxHeapify(self.leftChild(pos))
			else:
				self.swap(pos, self.rightChild(pos))
				self.maxHeapify(self.rightChild(pos))

func insert(value, weight):
	var element = Vector2()
	element.x = value
	element.y = weight
	if self.size >= self.max_size:
		return
	self.size += 1
	self.heap[self.size-1] = element
	var current = self.size - 1
	while (self.heap[current].y > self.heap[self.parent(current)].y):
		self.swap(current, self.parent(current))
		current = self.parent(current)

func extract_max():
	var popped = self.heap[self.front]
	self.heap[self.front] = self.heap[self.size - 1]
	self.size -= 1
	self.maxHeapify(self.front);
	return popped.x
