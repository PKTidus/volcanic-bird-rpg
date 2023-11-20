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
]
