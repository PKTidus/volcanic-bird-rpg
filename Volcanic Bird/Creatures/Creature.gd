extends Resource

class_name Creatures

# If accessed from a .tres file, we need to @export otherwise it will get deleted
# from the .tres file
@export var name : String
@export var description : String
@export var texture : Resource
@export var agility : int
@export var strength : int
@export var intelligence : int
