class_name EventManager

var event

func _init():
	var choice = RandomNumberGenerator.new().randi() % 3;
	self.event = EventList.List[choice]
	pass
