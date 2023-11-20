class_name OptionResult

var description: String
var type: String # can be "battle" or "buff"
var enemy_paths: Array[String] # the resource paths of the enemies to be loaded
var chance: int # chance of event occuring

func _init(description, type, chance, enemy_paths: Array[String]):
	self.description = description
	self.type = type
	self.chance = chance
	if enemy_paths != null:
		self.enemy_paths = enemy_paths
