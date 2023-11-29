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
	Global.eventCompleted = true

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
		get_tree().change_scene_to_file("res://battleScene/battle.tscn")
	elif self.outcome.type == "character-addition":
		for path in self.outcome.enemy_paths:
			var creature = load(path)
			var newCreature = Creatures.new()
			newCreature.initializeCreature(creature)
			# SCALING!!!!!!
			if Global.totalEventsCompleted > 0:
				newCreature.buffAll(ceil(float(Global.totalEventsCompleted)/1.5))
				newCreature.max_hp += Global.totalEventsCompleted
				newCreature.cur_hp += Global.totalEventsCompleted
				newCreature.max_mp += Global.totalEventsCompleted
				newCreature.cur_mp += Global.totalEventsCompleted
			Global.creatureStorage.append(newCreature)
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
	elif self.outcome.type == "item-addition":
		for path in self.outcome.enemy_paths:
			var tempItem = load(path)
			var newItem = Item.new()
			newItem.initializeItem(tempItem)
			Global.itemStorage.append(newItem)
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
	elif self.outcome.type == "attack-buff":
		var modifier = self.outcome.enemy_paths[0]
		for creature in Global.battleGroup:
			creature.buffAttack(int(modifier))
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
	elif self.outcome.type == "defense-buff":
		var modifier = self.outcome.enemy_paths[0]
		for creature in Global.battleGroup:
			creature.buffDefense(int(modifier))
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
	elif self.outcome.type == "speed-buff":
		var modifier = self.outcome.enemy_paths[0]
		for creature in Global.battleGroup:
			creature.buffSpeed(int(modifier))
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
	elif self.outcome.type == "all-buff":
		var modifier = int(self.outcome.enemy_paths[0])
		for creature in Global.battleGroup:
			creature.buffAll(int(modifier))
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
	elif self.outcome.type == "level-up":
		for creature in Global.battleGroup:
			creature.levelUp()
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
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
	Global.background = self.event.background
	$"Option A".visible = false
	$"Option C".visible = false
	$"Option B".text = "Proceed"
	$"EventDescription".text = self.outcome.description
	self.event_collapsed = true
