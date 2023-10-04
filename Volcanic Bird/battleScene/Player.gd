extends Panel

@export var player_name : String
@export var hp : int
@export var max_hp : int
@export var mp : int

var level
var experience
var defense
var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Name".text = player_name
	$"HPNumber".text = str(hp) + "/" + str(max_hp)
	$"MPNumber".text = str(mp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
