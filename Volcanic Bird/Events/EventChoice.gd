extends Node2D

var event_manager: EventManager
var event: Event
var event_collapsed: bool
var outcome: OptionResult

# Called when the node enters the scene tree for the first time.
func _ready():
	self.event_manager = EventManager.new()
	self.event = self.event_manager.event
	Global.event = self.event
	$"EventTitle".text = self.event.title
	$"EventDescription".text = self.event.description
	$"Option A".text = self.event.option_a.option_title
	$"Option B".text = self.event.option_b.option_title
	$"Option C".text = self.event.option_c.option_title
	self.event_collapsed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Button handlers
func _on_option_a_pressed():
	if not event_collapsed:
		collapse_event('a')

func _on_option_b_pressed():
	if not event_collapsed:
		collapse_event('b')
	elif self.outcome.type == "battle":
		get_tree().change_scene_to_file("res://battleScene/battle.tscn"	)
	else:
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn"	)

func _on_option_c_pressed():
	if not event_collapsed:
		collapse_event('c')

# Functions
func collapse_event(option):
	if option == 'a':
		self.outcome = self.event.option_a.collapse()
	elif option == 'b':
		self.outcome = self.event.option_b.collapse()
	else:
		self.outcome = self.event.option_c.collapse()
	var enemy_paths = self.outcome.enemy_paths
	Global.selected_enemy_paths = enemy_paths
	$"Option A".visible = false
	$"Option C".visible = false
	$"Option B".text = "Proceed"
	$"EventDescription".text = self.outcome.description
	self.event_collapsed = true
