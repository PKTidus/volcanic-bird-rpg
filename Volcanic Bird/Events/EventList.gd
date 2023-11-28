class_name EventList

static var List = [
	# EVENT 1 SHROOMS
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
					60, # chance
					[ # enemies
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres"
					]
				),
				OptionResult.new(
					"You step into the circle, the shrooms dance around you a bit. They seem friendly, and thank you for your cooperation. You aren't sure what they did. All your creatures' stats increased by 3!",
					"all-buff",
					40,
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
	# EVENT 2 TREES
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
						"res://Items/TreeBark.tres",
						"res://Items/TreeSap.tres"
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
	# EVENT 3 BLOCKADE
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
					60, # chance
					[ # enemies
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres"
					]
				),
				OptionResult.new(
					"You catch the wizards off guard and one runs away in fear! The other wizards prepare to fight.", # description
					"battle", # type
					40, # chance
					[ # enemies
						"res://Enemies/DummyEnemy.tres",
						"res://Enemies/WizardEnemy.tres",
						"res://Enemies/WizardEnemy.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/scifi.png",
	),
	# EVENT 4 VILLAGERS
	Event.new(
		"Village Acquaintances", 
		
		"You come across a peaceful village and are greeted by some friendly looking villagers.", 
		
		# option A
		Option.new(
			"Request supplies",
			[
				OptionResult.new(
					"The villagers happily donate an assortment of helpful items to you! You put them away in storage.", # description
					"item-addition", # type
					70, # chance
					[
						"res://Items/Type8.tres",
						"res://Items/Type3.tres",
						"res://Items/Type4.tres",
						"res://Items/Type5.tres",
						"res://Items/Type6.tres",
						"res://Items/Type7.tres"
					]
				),
				OptionResult.new(
					"The villagers' happy expressions quickly fade and they ask you to leave.",
					"escape",
					30,
					[]
				)
			]
		), 
		
		# option B
		Option.new(
			"Attack",
			[
				OptionResult.new(
					"The villagers were prepared and ready their arms.",
					"battle",
					70,
					[
						"res://Enemies/Villager_FEnemy.tres",
						"res://Enemies/Villager_MEnemy.tres",
						"res://Enemies/Villager_FEnemy.tres"
					]
				),
				OptionResult.new(
					"Most of them run in fear but one villager assumes a fighting pose.", # description
					"battle", # type
					30, # chance
					[
						"res://Enemies/DummyEnemy.tres",
						"res://Enemies/Villager_MEnemy.tres",
						"res://Enemies/DummyEnemy.tres"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Request cooperation",
			[
				OptionResult.new(
					"A burly looking villager is eager to join you on your quest!", # description
					"character-addition", # type
					55, # chance
					[ # enemies
						"res://Creatures/Villager_M.tres"
					]
				),
				OptionResult.new(
					"A smart looking villager is eager to join you on your quest!", # description
					"character-addition", # type
					45, # chance
					[ # enemies
						"res://Creatures/Villager_F.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/forest.png",
	),
	# EVENT 5 CROWILLA
	Event.new(
		"The Strongest Bird", 
		
		"You spot a crowilla chopping down entire trees, seemingly for no reason other than to test its strength.",
		
		# option A
		Option.new(
			"Attack",
			[
				OptionResult.new(
					"The crowilla acknowledges your will to fight and joins the party without your consent! The crowilla awaits in storage.", # description
					"character-addition", # type
					70, # chance
					[
						"res://Creatures/Crowilla.tres"
					]
				),
				OptionResult.new(
					"The crowilla brushes off your attacks with ease and walks away.",
					"escape",
					30,
					[]
				)
			]
		), 
		
		# option B
		Option.new(
			"Try to recruit it",
			[
				OptionResult.new(
					"You are suddenly attacked by forest creatures before you are able to reach the crowilla!",
					"battle",
					70,
					[
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/TreeEnemy.tres",
						"res://Enemies/DummyEnemy.tres"
					]
				),
				OptionResult.new(
					"The crowilla senses your weak aura and attacks!", # description
					"battle", # type
					30, # chance
					[
						"res://Enemies/DummyEnemy.tres",
						"res://Enemies/CrowillaEnemy.tres",
						"res://Enemies/DummyEnemy.tres"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Run away",
			[
				OptionResult.new(
					"The crowilla senses your weakness from afar and attacks!", # description
					"battle", # type
					60, # chance
					[ # enemies
						"res://Enemies/CrowillaEnemy.tres"
					]
				),
				OptionResult.new(
					"The crowilla pursues you! He hands you some tree bark and walks away. Tree bark can be found in storage.", # description
					"item-addition", # type
					40, # chance
					[ # enemies
						"res://Items/TreeBark.tres",
						"res://Items/TreeBark.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/forest.png",
	),
	
	# 5 EVENTS BEFORE THIS POINT, AT LEAST 10 AFTER THIS POINT
	# Event 6
	Event.new(
		"F.K. in the Coffee", 
		
		"After a long day of adventuring you sit down and pour yourself a cup of coffee. It says FK in the coffee...",
		
		# option A
		Option.new(
			"Drink it",
			[
				OptionResult.new(
					"The coffee tastes awful, so you spit it out back into your mug. The mug scolds you and then pleads to join your party!", # description
					"character-addition", # type
					70, # chance
					[
						"res://Creatures/Dizzy_Mug.tres"
					]
				),
				OptionResult.new(
					"You spit the coffee to the ground and it tries to kill you! You run away with blinding speed. Your party gained speed!",
					"speed-buff",
					30,
					[
						"3"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Ponder it",
			[
				OptionResult.new(
					"After a good ponder it hits you clear as a crisp spring morning: FK... Francis Kaysen. Your party gained attack!",
					"attack-buff",
					60,
					[
						"2"
					]
				),
				OptionResult.new(
					"You're unable to figure out what FK means, the coffee mug and its cohorts springs to life and attack!", # description
					"battle", # type
					40, # chance
					[
						"res://Enemies/Dizzy_MugEnemy.tres",
						"res://Enemies/Dizzy_MugEnemy.tres",
						"res://Enemies/Dizzy_MugEnemy.tres"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Dump it",
			[
				OptionResult.new(
					"The coffee forms into words on the ground after you dump it: Francis Kaysen. So that's what it means. Your party gained defense!", # description
					"defense-buff", # type
					60, # chance
					[ # enemies
						"0.4"
					]
				),
				OptionResult.new(
					"The spilled coffee glows blue and becomes mana restoration items! You put your mystic items in storage.", # description
					"item-addition", # type
					40, # chance
					[ # enemies
						"res://Items/Type8.tres",
						"res://Items/Type8.tres",
						"res://Items/Type8.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/ice.png",
	)
]
