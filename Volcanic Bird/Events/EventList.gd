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
					75, # chance
					[ # enemies
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres"
					]
				),
				OptionResult.new(
					"You step into the circle, the shrooms dance around you a bit. They seem friendly, and thank you for your cooperation. You aren't sure what they did.",
					"escape",
					25,
					[]
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
						"res://Enemies/ShroomEnemy.tres",
						"res://Enemies/ShroomEnemy.tres"
					]
				)
			]
		), 
	),
	Event.new(
		"Slumbering Trees", 
		
		"You stumble upon a group of three trees. You notice these are no normal trees, but living trees.", 
		
		# option A
		Option.new(
			"Gently wake them.",
			[
				OptionResult.new(
					"They welcome your presence and wish to join you. 3 Trees can be found in creature storage.", # description
					"escape", # type
					70, # chance
					[]
				),
				OptionResult.new(
					"Two of the trees are upset with being awaken, but one wishes to join you. 1 Tree can be found in creature storage.",
					"escape",
					30,
					[]
				)
			]
		), 
		
		# option B
		Option.new(
			"Chop their wood.",
			[
				OptionResult.new(
					"The trees are chopped before they have a chance to fight back. They wimper quietly as their sap is drained by your blades.",
					"escape",
					75,
					[]
				),
				OptionResult.new(
					"Before you can swing, a tree you didn't notice steps between you and knocks you back.", # description
					"battle", # type
					25, # chance
					[ # enemies
						"res://Enemies/TreeEnemy.tres",
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
						"res://Enemies/TreeEnemy.tres",
						"res://Enemies/TreeEnemy.tres"
					]
				),
				OptionResult.new(
					"You are unable to torch any of the trees before they are able to attack.", # description
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
	),
]
