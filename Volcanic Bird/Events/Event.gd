class_name Event

var title: String
var description: String

var option_a: Option
var option_b: Option
var option_c: Option

func _init(title, description, option_a, option_b, option_c):
	self.title = title
	self.description = description
	self.option_a = option_a
	self.option_b = option_b
	self.option_c = option_c
