class_name EventManager

var event
var numEvents = len(EventList.List)

func _init():
	if numEvents == Global.usedEvents.size():
		Global.usedEvents.clear()
	var choice = RandomNumberGenerator.new().randi() % len(EventList.List);
	while Global.usedEvents.has(choice):
		choice = RandomNumberGenerator.new().randi() % len(EventList.List);
	Global.usedEvents[choice] = true
	self.event = EventList.List[choice]
	pass
