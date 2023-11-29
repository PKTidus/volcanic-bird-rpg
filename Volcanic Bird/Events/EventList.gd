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
					"You step into the circle, the shrooms dance around you a bit. They seem friendly, and thank you for your cooperation. You aren't sure what they did. All your creatures' stats increased!",
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
		
		"You and your party walk into a cave. While inside, a group of wizards set up camp near the entrance. What do you do?", 
		
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
			"Wait",
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
			"Attack",
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
		
		"You come across a peaceful village and are greeted by some friendly looking villagers. What do you ask them for?", 
		
		# option A
		Option.new(
			"Supplies",
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
			"A fight",
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
			"Cooperation",
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
						"res://Enemies/DummyEnemy.tres",
						"res://Enemies/CrowillaEnemy.tres",
						"res://Enemies/DummyEnemy.tres"
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
		"FK in the Coffee", 
		
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
	),
	# Event 7 COFFEE TABLE
	Event.new(
		"A heated and chilly argument", 
		
		"After setting up camp on an iceberg you hear noises coming from nearby. There is a table having a disagreement with a coffee mug... Who do you side with?",
		
		# option A
		Option.new(
			"Coffee",
			[
				OptionResult.new(
					"You settle the argument in the mug's favor. It would like to join you! It awaits you in creature storage.", # description
					"character-addition", # type
					70, # chance
					[
						"res://Creatures/Dizzy_Mug.tres"
					]
				),
				OptionResult.new(
					"The table gathers some allies and attacks!",
					"battle",
					30,
					[
						"res://Enemies/JoeyEnemy.tres",
						"res://Enemies/TableEnemy.tres",
						"res://Enemies/JoeyEnemy.tres"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Neither",
			[
				OptionResult.new(
					"They both redirect their anger at you!",
					"battle",
					60,
					[
						"res://Enemies/Dizzy_MugEnemy.tres",
						"res://Enemies/DummyEnemy.tres",
						"res://Enemies/TableEnemy.tres"
					]
				),
				OptionResult.new(
					"You manage to stop the argument... a nice feeling wells up inside you and your whole party levels up once!", # description
					"escape", # type
					40, # chance
					[
						"1"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Table",
			[
				OptionResult.new(
					"You settle the argument in the table's favor. The table thanks you and teaches you the secret of its strength. Your party's defense greatly increased!", # description
					"defense-buff", # type
					60, # chance
					[ # enemies
						"0.6"
					]
				),
				OptionResult.new(
					"You settle the argument in the table's favor. The table eagerly would like to join you! It awaits you in creature storage.", # description
					"character-addition", # type
					40, # chance
					[ # enemies
						"res://Creatures/Table.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/ice.png",
	),
	# EVENT 8
	Event.new(
		"A Funky Tune", 
		
		"You walk in on a group of frogs performing a song. They finish and turn their attention towards you.",
		
		# option A
		Option.new(
			"Clap",
			[
				OptionResult.new(
					"The frogs are flattered and would like to join the party! They await you in creature storage.", # description
					"character-addition", # type
					70, # chance
					[
						"res://Creatures/Funky_Frog.tres",
						"res://Creatures/Funky_Frog.tres"
					]
				),
				OptionResult.new(
					"The frogs felt insulted that you would applaud such a subpar performance and leap at you!",
					"battle",
					30,
					[
						"res://Enemies/Funky_FrogEnemy.tres",
						"res://Enemies/Funky_FrogEnemy.tres",
						"res://Enemies/Funky_FrogEnemy.tres"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Attack",
			[
				OptionResult.new(
					"The frogs sing a lullaby and you black out! When you wake up the frogs are nowhere to be found.",
					"escape",
					100,
					[]
				)
			]
		), 
		
		# option C
		Option.new(
			"Request Lessons",
			[
				OptionResult.new(
					"The frogs misunderstood your request and teach you their secret martial arts instead. You train with them for a week! Your creatures' attack greatly increases!", # description
					"attack-buff", # type
					60, # chance
					[ # enemies
						"4"
					]
				),
				OptionResult.new(
					"The frogs happily teach you some tunes! You felt a warm fuzzy feeling, all your creatures' stats increased slightly!", # type
					"all-buff",
					40, # chance
					[ # enemies
						"1"
					]
				)
			]
		),
		"res://Resources/Backgrounds/forest.png",
	),
	# EVENT 9
	Event.new(
		"Birdwatching", 
		
		"You decide to go birdwatching, what kind of bird are you looking for?",
		
		# option A
		Option.new(
			"Strong",
			[
				OptionResult.new(
					"You check out the forest and see a crowilla punching a bunch of shrooms. You are in awe at its fighting prowess. Your creatures' attack increased!", # description
					"attack-buff", # type
					100, # chance
					[
						"3"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Flightless",
			[
				OptionResult.new(
					"You check out an icy area and observe some penguins sliding around at crazy speeds! You wish you could be that fast. Your creatures' speed greatly increased!",
					"speed-buff",
					100,
					[
						"5"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Robotic",
			[
				OptionResult.new(
					"You check out a spaceship hangar. Before you can understand what's going on you are attacked!", # description
					"battle", # type
					60, # chance
					[ # enemies
						"res://Enemies/RobirdoEnemy.tres",
						"res://Enemies/RobirdoEnemy.tres",
						"res://Enemies/RobirdoEnemy.tres"
					]
				),
				OptionResult.new(
					"You check out a spaceship hangar. A group of robirdos approach you and want to join your party! They await you in creature storage.", # type
					"character-addition",
					40, # chance
					[ # enemies
						"res://Creatures/Robirdo.tres",
						"res://Creatures/Robirdo.tres",
						"res://Creatures/Robirdo.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/scifi.png",
	),
	# Event 10
	Event.new(
		"Pick up the phone", 
		
		"Something is ringing in your bag. You found the source of the ringing, it's a landline phone. You don't own a phone and have no clue why anyone would carry around one of these in the first place...",
		
		# option A
		Option.new(
			"Answer",
			[
				OptionResult.new(
					"You answer the call and speak directly to the phone itself! It would like to join your party. It awaits you in creature storage.", # description
					"character-addition", # type
					70, # chance
					[
						"res://Creatures/Phone.tres"
					]
				),
				OptionResult.new(
					"The phone floats out of your hands and you realize you're surrounded by hostile phones!",
					"battle",
					30,
					[
						"res://Enemies/PhoneEnemy.tres",
						"res://Enemies/PhoneEnemy.tres",
						"res://Enemies/PhoneEnemy.tres"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Smash it",
			[
				OptionResult.new(
					"The phone is sadly crushed to bits. You should be a little nicer.",
					"escape",
					100,
					[]
				)
			]
		), 
		
		# option C
		Option.new(
			"Trade it",
			[
				OptionResult.new(
					"You decide to trade the eternally ringing phone for some creature supplements. Your party's attack increased!", # description
					"attack-buff", # type
					60, # chance
					[ # enemies
						"2"
					]
				),
				OptionResult.new(
					"You decide to trade the eternally ringing phone for some creature supplements. Your party's defense increased!", # type
					"defense-buff",
					40, # chance
					[ # enemies
						"0.3"
					]
				)
			]
		),
		"res://Resources/Backgrounds/scifi.png",
	),
	# Event 11
	Event.new(
		"Gamer Troubles", 
		
		"You feel nostalgic and boot up a classic, The Last of Us: Part IV, but notice your only controller is dead. How do you react?",
		
		# option A
		Option.new(
			"Charge it",
			[
				OptionResult.new(
					"Your USB micro does not want to charge your controller and urges you to take it with you on your journey. It awaits you in creature storage.", # description
					"character-addition", # type
					60, # chance
					[
						"res://Creatures/USB_Micro.tres"
					]
				),
				OptionResult.new(
					"You grabbed a USB mini by mistake and all your USB micro cables attack in outrage!",
					"battle",
					40,
					[
						"res://Enemies/USB_MicroEnemy.tres",
						"res://Enemies/USB_MicroEnemy.tres",
						"res://Enemies/USB_MicroEnemy.tres"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Have a picnic",
			[
				OptionResult.new(
					"You decide to hang out with your creatures outside and share some Panda Express you ordered. Your creatures leveled up!",
					"level-up",
					100,
					[]
				)
			]
		), 
		
		# option C
		Option.new(
			"Watch a movie",
			[
				OptionResult.new(
					"You decide to watch a movie about a group of high schoolers covering up a murder. It was absolute cinema. All your creatures' stats increased!", # description
					"all-buff", # type
					60, # chance
					[ # enemies
						"3"
					]
				),
				OptionResult.new(
					"You decide to watch a movie about a boxing champion that wouldn't stay down no matter how much he was hit. It was inspirational. Your creatures' defenses increased significantly!", # type
					"defense-buff",
					40, # chance
					[ # enemies
						"0.8"
					]
				)
			]
		),
		"res://Resources/Backgrounds/scifi.png",
	),
	# Event 12 Penguin
	Event.new(
		"Transcendent being", 
		
		"You hear a rumor about a new species of penguin and go to investigate. You spot a particular penguin acting strange and moments later are blinded by a flash of light. The penguin has transformed!",
		
		# option A
		Option.new(
			"Challenge it",
			[
				OptionResult.new(
					"The penguin accepts your challenge!", # description
					"battle", # type
					60, # chance
					[
						"res://Enemies/DummyEnemy.tres",
						"res://Enemies/PenguinEnemy.tres",
						"res://Enemies/DummyEnemy.tres"
					]
				),
				OptionResult.new(
					"The penguin summons an ally and engages you in battle!",
					"battle",
					40,
					[
						"res://Enemies/DummyEnemy.tres",
						"res://Enemies/PenguinEnemy.tres",
						"res://Enemies/PenguinEnemy.tres"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Recruit it",
			[
				OptionResult.new(
					"You persuade the penguin to accompany you on your journey! It awaits you in creature storage.",
					"character-addition",
					60,
					[
						"res://Creatures/Penguin.tres"
					]
				),
				OptionResult.new(
					"The penguin agrees to join, but only if his buddy Joey can come along. They both await you in creature storage.",
					"character-addition",
					40,
					[
						"res://Creatures/Penguin.tres",
						"res://Creatures/Joey.tres"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Cower in fear",
			[
				OptionResult.new(
					"You freak out for a while and decide to leave. You escape with no incident. That penguin could have definitely killed you.", # description
					"escape", # type
					70, # chance
					[]
				),
				OptionResult.new(
					"As you have a mental breakdown you notice an abandoned backpack full of useful stuff! You put it all in storage.", # type
					"item-addition",
					30, # chance
					[ # enemies
						"res://Items/TreeBark.tres",
						"res://Items/TreeSap.tres",
						"res://Items/Type3.tres",
						"res://Items/Type8.tres",
						"res://Items/Type7.tres",
						"res://Items/Type4.tres"
					]
				)
			]
		),
		"res://Resources/Backgrounds/ice.png",
	),
	# Event 13 Joey
	Event.new(
		"Encounter with snowkind", 
		
		"You see an abnormally large pile of snowballs on a table. Upon further inspection you realize it is a pack of Joey Snows and an Iced Coffee Table.",
		
		# option A
		Option.new(
			"Burn them",
			[
				OptionResult.new(
					"Nothing was left after you torched the innocent creatures.", # description
					"escape", # type
					100, # chance
					[]
				)
			]
		), 
		
		# option B
		Option.new(
			"Recruit",
			[
				OptionResult.new(
					"Two Joeys and the Table are eager to join you! They await you in creature storage.",
					"character-addition",
					60,
					[
						"res://Creatures/Joey.tres",
						"res://Creatures/Joey.tres",
						"res://Creatures/Table.tres"
					]
				),
				OptionResult.new(
					"The table is uninterested and walks away, you decide to move on as well. You notice one of the Joeys from the pile followed you and you decide to take it in. It awaits you in creature storage.",
					"character-addition",
					40,
					[
						"res://Creatures/Joey.tres"
					]
				)
			]
		), 
		
		# option C
		Option.new(
			"Naptime",
			[
				OptionResult.new(
					"You try to take a nap in the shade provided by the table but it does not appreciate this and attacks!", # description
					"battle", # type
					65, # chance
					[
						"res://Enemies/DummyEnemy.tres",
						"res://Enemies/TableEnemy.tres",
						"res://Enemies/DummyEnemy.tres"
					]
				),
				OptionResult.new(
					"You take a nap in the table's shade. You and your creatures feel great! All your creatures' stats increased!", # type
					"all-buff",
					35, # chance
					[ # enemies
						"2"
					]
				)
			]
		),
		"res://Resources/Backgrounds/ice.png",
	),
	# Event 14 Shroom
	Event.new(
		"Shady Merchant", 
		
		"You meet a merchant selling various kinds of food. He is offering generous free samples, which will you take?",
		
		# option A
		Option.new(
			"Mushrooms",
			[
				OptionResult.new(
					"The mushrooms were actually some sentient forest Shrooms! You persuade them to join you. They await you in creature storage.", # description
					"character-addition", # type
					100, # chance
					[
						"res://Creatures/Shroom.tres",
						"res://Creatures/Shroom.tres"
					]
				)
			]
		), 
		
		# option B
		Option.new(
			"Cheese",
			[
				OptionResult.new(
					"The cheese made you feel sick. Nothing else of note happened.", # description
					"escape", # type
					100, # chance
					[]
				)
			]
		), 
		
		# option C
		Option.new(
			"Bananas",
			[
				OptionResult.new(
					"You and your creatures enjoy the bananas as a snack. Your creatures leveled up!", # description
					"level-up", # type
					100, # chance
					[]
				)
			]
		),
		"res://Resources/Backgrounds/forest.png",
	)
]
