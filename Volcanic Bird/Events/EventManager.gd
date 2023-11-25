class_name EventManager

var event

func _init():
	var choice = RandomNumberGenerator.new().randi() % len(EventList.List);
	self.event = EventList.List[choice]
	pass
