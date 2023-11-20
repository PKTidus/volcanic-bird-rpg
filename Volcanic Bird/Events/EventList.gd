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
					"It's a trap! 1", # description
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
		
		# option B
		Option.new(
			"Politely excuse your party",
			[
				OptionResult.new(
					"It's a trap!", # description
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
		
		# option C
		Option.new(
			"Join in",
			[
				OptionResult.new(
					"It's a trap! 3", # description
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
