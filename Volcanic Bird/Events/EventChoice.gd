extends Node2D

var event_manager: EventManager
var event: Event

# Called when the node enters the scene tree for the first time.
func _ready():
	self.event_manager = EventManager.new()
	self.event = self.event_manager.event
	$"EventTitle".text = self.event.title
	$"EventDescription".text = self.event.description
	$"Option A".text = self.event.option_a_label
	$"Option B".text = self.event.option_b_label
	$"Option C".text = self.event.option_c_label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Button handlers
func _on_option_a_pressed():
	goToBattle()

func _on_option_b_pressed():
	goToBattle()

func _on_option_c_pressed():
	goToBattle()

# Functions
func goToBattle():
	get_tree().change_scene_to_file("res://battleScene/battle.tscn")
