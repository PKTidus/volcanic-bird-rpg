class_name EventList

static var List = [
	# demo event 1
	Event.new(
		"Shroom Villagers", 
		
		"You find a village of shrooms, which are performing a strange ritual. They notice your presence, and ask you to stand in the middle of their ritual circle.", 
		
		# option A
		Option.new(
			"Join in",
			[
				OptionResult.new(
					"It's a trap!", # description
					"battle", # type
					50, # chance
					[ # enemies
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres"
					]
				),
				OptionResult.new(
					"You step into the circle, the shrooms dance around you a bit. They seem friendly, and thank you for your cooperation. You aren't sure what they did. All your creatures' stats increased by 3!",
					"all-buff",
					50,
					[
						"3"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Politely leave",
			[
				OptionResult.new(
					"They accept your refusal, and continue their ritual without you.",
					"escape",
					75,
					[]
				),
				OptionResult.new(
					"It's a trap!", # description
					"battle", # type
					25, # chance
					[ # enemies
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Attack",
			[
				OptionResult.new(
					"You draw your weapons, but the shrooms do not seem scared.", # description
					"battle", # type
					100, # chance
					[ # enemies
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/forest.png",
	),
	Event.new(
		"Slumbering Trees", 
		
		"You stumble upon a group of three trees. You notice these are no normal trees, but sentient trees.", 
		
		# option A
		Option.new(
			"Gently wake them",
			[
				OptionResult.new(
					"They welcome your presence and wish to join you. 3 Trees can be found in creature storage.", # description
					"character-addition", # type
					70, # chance
					[
						"res://Creatures/Tree.tres",
						"res://Creatures/Tree.tres",
						"res://Creatures/Tree.tres",
					]
				),
				OptionResult.new(
					"Two of the trees are upset with being awakened, but one wishes to join you. 1 Tree can be found in creature storage.",
					"character-addition",
					30,
					[
						"res://Creatures/Tree.tres"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Chop their wood",
			[
				OptionResult.new(
					"The trees are chopped before they have a chance to fight back. They whimper quietly as their sap is drained by your blades. Tree sap and tree bark have been added to storage.",
					"item-addition",
					75,
					[ # items
						"res://Items/HealingPotion.tres",
						"res://Items/HealingPotion.tres"
					]
				),
				OptionResult.new(
					"Before you can swing, a tree you didn't notice steps between you and knocks you back.", # description
					"battle", # type
					25, # chance
					[ # enemies
						"res://Enemies/TreeEnemy.tres",
						"res://Enemies/TreeEnemy.tres",
						"res://Enemies/TreeEnemy.tres"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Set fire",
			[
				OptionResult.new(
					"You are able to torch one of the trees before they are able to attack.", # description
					"battle", # type
					60, # chance
					[ # enemies
						"res://Enemies/TreeEnemy.tres",
						"res://Enemies/TreeEnemy.tres",
						"res://Enemies/DummyEnemy.tres"
					]
				),
				OptionResult.new(
					"You are unable to torch any of the trees before they notice.", # description
					"battle", # type
					40, # chance
					[ # enemies
						"res://Enemies/TreeEnemy.tres",
						"res://Enemies/TreeEnemy.tres",
						"res://Enemies/TreeEnemy.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/ice.png",
	),
	Event.new(
		"Blockade", 
		
		"You and your party walk into a cave. While inside, a group of wizards set up camp near the entrance.", 
		
		# option A
		Option.new(
			"Exit quietly",
			[
				OptionResult.new(
					"The wizards notice you trying to escape", # description
					"battle", # type
					70, # chance
					[
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres"
					]
				),
				OptionResult.new(
					"The wizards are unaware of you. You escape without notice.",
					"escape",
					30,
					[]
				)
			]
		), 
		
		# option B
		Option.new(
			"Wait.",
			[
				OptionResult.new(
					"The wizards keep their camp. Eventually, they notice you.",
					"battle",
					70,
					[
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres"
					]
				),
				OptionResult.new(
					"The wizards pack camp and move on. You pass by.", # description
					"escape", # type
					30, # chance
					[]
				)
			]
		), 
		
		# option C
		Option.new(
			"Attack the wizards",
			[
				OptionResult.new(
					"You engage the wizards in combat", # description
					"battle", # type
					100, # chance
					[ # enemies
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/scifi.png",
	),
	
	Event.new(
		"Village Acquaintances", 
		
		"You and your party walk into a cave. While inside, a group of wizards set up camp near the entrance.", 
		
		# option A
		Option.new(
			"Exit quietly",
			[
				OptionResult.new(
					"The wizards notice you trying to escape", # description
					"battle", # type
					70, # chance
					[
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres"
					]
				),
				OptionResult.new(
					"The wizards are unaware of you. You escape without notice.",
					"escape",
					30,
					[]
				)
			]
		), 
		
		# option B
		Option.new(
			"Wait.",
			[
				OptionResult.new(
					"The wizards keep their camp. Eventually, they notice you.",
					"battle",
					70,
					[
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres"
					]
				),
				OptionResult.new(
					"The wizards pack camp and move on. You pass by.", # description
					"escape", # type
					30, # chance
					[]
				)
			]
		), 
		
		# option C
		Option.new(
			"Attack the wizards",
			[
				OptionResult.new(
					"You engage the wizards in combat", # description
					"battle", # type
					100, # chance
					[ # enemies
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/forest.png",
	),
]
