extends Control


# 4 party members max
var player0 = null
var player1 = null
var player2 = null
var player3 = null

# Array for storing the attacks
# Indices are the players (0-3)
# Values are the selected enemies (0-3)
# 	0 is for not attacking
# 	1-3 is for the enemy node
var selectedEnemies = [null, null, null, null]

# 1 = attack
# 2 = skill
# 3 = item
var typeOfMove = 0

# Array for storing the party members defending
# Indices are the players (0-3)
# Values are a flag
# 	0 is for not defending
# 	1 is for defending
var defendingPlayers = [0, 0, 0, 0]

# 3 enemies max
var enemy1
var enemy2
var enemy3

# for sample enemies
var sampleEnemy1
var sampleEnemy2
var sampleEnemy3
var sampleArray = []

var currentPlayerCounter # range from 1-4
var currentEnemyCounter # range from 1-3

func _ready():
	setupSampleGroup() # testing purposes
	setupSampleEnemy() # testing purposes
	loadSampleItem() # please remove, testing purposes only
	connectSignals()
	initializeMoves()
	hideEnemyButtons()
	getPlayerInfo()
	getEnemyInfo()
	loadCreatures() 
	loadEnemies()
	
	currentPlayerCounter = 0
	currentEnemyCounter = 0
	
	trackBattle()

func connectSignals():
	Global.connect("skillObtained", closePanelAndShowEnemiesSkills)
	Global.connect("itemObtained", closePanelAndShowAlliesItems)
	
func closePanelAndShowEnemiesSkills():
	if Global.friendlyOrNot == 0:
		print("reached the signal")
		$"Skill List Panel".hide()
		showTextBox("Which enemy?")
		showEnemyButtons()
	elif Global.friendlyOrNot == 1:
		print("reached Frinedly")
		$"Skill List Panel".hide()
		showTextBox("Which ally?")

func closePanelAndShowAlliesItems():
	if Global.friendlyOrNot == 1:
		print("reached the signal for items")
		$"Item List Panel".hide()
		showTextBox("Which ally?")
	elif Global.friendlyOrNot == 0:
		print("reached the signal")
		$"Item List Panel".hide()
		showTextBox("Which enemy?")
		showEnemyButtons()

# Simply for loading in sample creatures, not needed for final build
func setupSampleGroup():
	var samepleCreature1 = load("res://Creatures/Purple_Flower.tres")
	var samepleCreature2 = load("res://Creatures/Purple_Flower.tres")
	var samepleCreature3 = load("res://Creatures/Shroom.tres")
	var samepleCreature4 = load("res://Creatures/Wizard.tres")
	var creature1 = Creatures.new()
	var creature2 = Creatures.new()
	var creature3 = Creatures.new()
	var creature4 = Creatures.new()
	
	creature1.initializeCreature(samepleCreature1)
	creature2.initializeCreature(samepleCreature2)
	creature3.initializeCreature(samepleCreature3)
	creature4.initializeCreature(samepleCreature4)
	
	Global.battleGroup[0] = creature1
	Global.battleGroup[1] = creature2
	Global.battleGroup[2] = creature3
	Global.battleGroup[3] = creature4
	
# Simply for loading in sample creatures, not need for final build
func setupSampleEnemy():
	sampleEnemy1 = load("res://Creatures/Tree.tres")
	sampleEnemy2 = load("res://Creatures/Tree.tres")
	sampleEnemy3 = load("res://Creatures/Tree.tres")
	var loadEnemy1 = Enemy.new()
	var loadEnemy2 = Enemy.new()
	var loadEnemy3 = Enemy.new()
	
	loadEnemy1.initializeEnemyData(sampleEnemy1)
	loadEnemy2.initializeEnemyData(sampleEnemy2)
	loadEnemy3.initializeEnemyData(sampleEnemy3)
	
	sampleArray.append(loadEnemy1)
	sampleArray.append(loadEnemy2)
	sampleArray.append(loadEnemy3)

func loadSampleItem():
	var tempItem = Item.new()
	var sampleItem = load("res://Items/HealingPotion.tres")
	tempItem.initializeItem(sampleItem)
	Global.itemInventory.append(tempItem)
	
	var tempItem2 = Item.new()
	var sampleItem2 = load("res://Items/Steroid.tres")
	tempItem2.initializeItem(sampleItem2)
	Global.itemInventory.append(tempItem2)
	
	var tempItem3 = Item.new()
	var sampleItem3 = load("res://Items/DeadlyPoison.tres")
	tempItem3.initializeItem(sampleItem3)
	Global.itemInventory.append(tempItem3)
  
# To load in the creatures into the buttons and their health and mp
func loadCreatures():
	var currentIndex = 0
	for node in $"Party Panel/Party Container".get_children():
		node.creatureData = Global.battleGroup[currentIndex]
		currentIndex += 1 
		node.emit_signal("updateButtons")
		if currentIndex == 4:
			break

# To load in the creature into the Enemy nodes and their health and texture
func loadEnemies():
	var currentIndex = 0
	for node in $"Enemies Container".get_children():
		node.enemyData = sampleArray[currentIndex]
		currentIndex += 1 
		node.emit_signal("updateEnemy")

func initializeMoves():
	# Creature's Moves
	for i in range(4):
		var currentMove = Moves.new()
		currentMove.move = 0
		currentMove.source = Global.battleGroup[i]
		currentMove.target = null
		selectedEnemies[i] = currentMove

func getPlayerInfo():
	player0 = $"Party Panel/Party Container/Player0"
	player1 = $"Party Panel/Party Container/Player1"
	player2 = $"Party Panel/Party Container/Player2"
	player3 = $"Party Panel/Party Container/Player3"

func getEnemyInfo():
	enemy1 = $"Enemies Container/Enemy1"
	enemy2 = $"Enemies Container/Enemy2"
	enemy3 = $"Enemies Container/Enemy3"

func trackBattle():
	print("Selected Enemies:  " + str(selectedEnemies))
	print("Defending Players: " + str(defendingPlayers))
	
	# Check if battle is over
	if enemy1.enemyData.current_hp <= 0 && enemy2.enemyData.current_hp <= 0 && enemy3.enemyData.current_hp <= 0:
		print("BATTLE OVER")
		updateTextBox("You and your party won!")
		disableButtons()
		
		await get_tree().create_timer(3).timeout # pause the game for 3 seconds
		$"Results".show() # display results scene
		
		# Update the text labels in the results scene
		updateResultsTextBox(0, player0.creatureData.name, player0.creatureData.level, player0.creatureData.experience, null)
		updateResultsTextBox(1, player1.creatureData.name, player1.creatureData.level, player1.creatureData.experience, null)
		updateResultsTextBox(2, player2.creatureData.name, player2.creatureData.level, player2.creatureData.experience, null)
		updateResultsTextBox(3, player3.creatureData.name, player3.creatureData.level, player3.creatureData.experience, null)
		return
	
	if currentPlayerCounter == 0:
		print("Player 0's Turn")
		updateTextBox("It is " + player0.creatureData.name + "'s turn")
	elif currentPlayerCounter == 1:
		print("Player 1's Turn")
		updateTextBox("It is " + player1.creatureData.name + "'s turn")
	elif currentPlayerCounter == 2:
		print("Player 2's Turn")
		updateTextBox("It is " + player2.creatureData.name + "'s turn")
	elif currentPlayerCounter == 3:
		print("Player 3's Turn")
		updateTextBox("It is " + player3.creatureData.name + "'s turn")

func _on_attack_pressed():
	typeOfMove = 1
	print("Attack Button Pressed")
	showTextBox("Which enemy?")
	showEnemyButtons()

func _on_skill_pressed():
	typeOfMove = 2
#	var skills = SkillList.new()
#	skills.initializeSkills()
#	print(skills.getSkillList())
#	skills.printSkillList()
	# This is to hide the buttons we have loaded in the scene
	for node in $"Skill List Panel/Skill List Container".get_children():
		node.hide()
	
	# This is where we load in the skills
	# The if statement is an error check if the skills array is empty
	# Shouldn't be empty if all the creatures have skills but good error check
	# I set the button skills (what skill the button contains) to the skillList of the
	# Creature in that specific index and then I emit the signal to update those changes
	# to the buttons interface and then I show that specific node that does contain a skill
	var index = 0
	for node in $"Skill List Panel/Skill List Container".get_children():
		if Global.battleGroup[currentPlayerCounter].skillList.size() != 0:
			node.skill = Global.battleGroup[currentPlayerCounter].skillList[index]
			node.emit_signal("updateSkillButton")
			node.show()
			index += 1
			if index >= Global.battleGroup[currentPlayerCounter].skillList.size():
				break
	$"Skill List Panel".show()
	showTextBox("Which Skill?")

func _on_defend_pressed():
	print("Defend Button Pressed")
	
	defendingPlayers[currentPlayerCounter] = 1
	updatePlayerCounter()
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()
	
	trackBattle()

func _on_item_pressed():
	typeOfMove = 3
	for node in $"Item List Panel/Item List Container".get_children():
		node.hide()
		
	var index = 0
	for node in $"Item List Panel/Item List Container".get_children():
		node.Item = Global.itemInventory[index]
		node.emit_signal("updateItemButton")
		node.show()
		index += 1
		if index >= Global.itemInventory.size():
			break
	$"Item List Panel".show()
	showTextBox("Which Item?")

func _on_run_pressed():
	var rng = RandomNumberGenerator.new()
	var randomNumber = rng.randi_range(1, 100)
	
	# Low Chance: Party escapes unharmed
	if randomNumber >= 1 && randomNumber <= 20:
		showTextBox("You and your party ran away.")
	
	# High Chance: Party escapes with hp damage
	elif randomNumber >= 21 && randomNumber <= 100:
		showTextBox("Your party loses 5 HP!\nYou and your party ran away.")
		player0.creatureData.decreaseHealth(5)
		player1.creatureData.decreaseHealth(5)
		player2.creatureData.decreaseHealth(5)
		player3.creatureData.decreaseHealth(5)
		
		updateBattleGroupHealth()
	
	await get_tree().create_timer(3).timeout # pause the game for 3 seconds
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn") # go to the hub menu scene

func hideTextBox():
	showButtons()
	$"Textbox Panel/Textbox"
	$"Textbox Panel/Textbox".text = ""

func showTextBox(text):
	hideButtons()
	$"Textbox Panel/Textbox".text = text

func updateTextBox(text):
	$"Textbox Panel/Textbox".text = text

func updateResultsTextBox(playerIndex: int, playerName: String, playerLevel: int, playerExperience: int, skillsLearned):
	var initialLevel = playerLevel
	playerExperience += calculateExperience(playerLevel)
	var nextLevelExperience = calculateExperience(playerLevel + 1)
	
	while playerExperience >= nextLevelExperience:
		playerLevel += 1
		nextLevelExperience = calculateExperience(playerLevel + 1)
	
	$"Results/Panel/HBoxContainer/".get_child(playerIndex).get_child(0).text = playerName + "\n" + \
	"Level " + str(initialLevel) + "->" + str(playerLevel) + "\n" + \
	"To Next: " + str(playerExperience) + "/" + str(calculateExperience(playerLevel + 1)) + "\n" + \
	"Obtained Skills:\n" + str(skillsLearned)
	
	Global.battleGroup[playerIndex].level = playerLevel
	Global.battleGroup[playerIndex].experience = playerExperience
	
	print(str(Global.battleGroup[playerIndex].level) + " " + str(Global.battleGroup[playerIndex].experience))

func calculateExperience(playerLevel: int):
	return (4 * playerLevel ** 3) / 5

func hideButtons():
	$"Actions Panel/Actions Container/Attack".hide()
	$"Actions Panel/Actions Container/Skill".hide()
	$"Actions Panel/Actions Container/Defend".hide()
	$"Actions Panel/Actions Container/Item".hide()
	$"Actions Panel/Actions Container/Run".hide()

func showButtons():
	$"Actions Panel/Actions Container/Attack".show()
	$"Actions Panel/Actions Container/Skill".show()
	$"Actions Panel/Actions Container/Defend".show()
	$"Actions Panel/Actions Container/Item".show()
	$"Actions Panel/Actions Container/Run".show()

func disableButtons():
	$"Actions Panel/Actions Container/Attack".disabled = true
	$"Actions Panel/Actions Container/Skill".disabled = true
	$"Actions Panel/Actions Container/Defend".disabled = true
	$"Actions Panel/Actions Container/Item".disabled = true
	$"Actions Panel/Actions Container/Run".disabled = true

func hideEnemyButtons():
	if has_node("Enemies Container/Enemy1"):
		$"Enemies Container/Enemy1/Button".hide()
	if has_node("Enemies Container/Enemy2"):
		$"Enemies Container/Enemy2/Button".hide()
	if has_node("Enemies Container/Enemy3"):
		$"Enemies Container/Enemy3/Button".hide()

func showEnemyButtons():
	if has_node("Enemies Container/Enemy1"):
		$"Enemies Container/Enemy1/Button".show()
	if has_node("Enemies Container/Enemy2"):
		$"Enemies Container/Enemy2/Button".show()
	if has_node("Enemies Container/Enemy3"):
		$"Enemies Container/Enemy3/Button".show()

func _on_enemy1_pressed():
	# attackEnemy(enemy1)
	selectedEnemies[currentPlayerCounter].target = enemy1
	selectedEnemies[currentPlayerCounter].move = typeOfMove
	
	if typeOfMove == 2:
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
	if typeOfMove == 3:
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		
	updatePlayerCounter()
	
	print(selectedEnemies)
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()
	
	trackBattle()

func _on_enemy2_pressed():
	# attackEnemy(enemy2)
	selectedEnemies[currentPlayerCounter].target = enemy2
	selectedEnemies[currentPlayerCounter].move = typeOfMove
	
	if typeOfMove == 2:
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
	if typeOfMove == 3:
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
	
	updatePlayerCounter()
	
	print(selectedEnemies)
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()
	
	trackBattle()

func _on_enemy3_pressed():
	# attackEnemy(enemy3)
	selectedEnemies[currentPlayerCounter].target = enemy3
	selectedEnemies[currentPlayerCounter].move = typeOfMove
	
	if typeOfMove == 2:
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
	if typeOfMove == 3:
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
	
	updatePlayerCounter()
	
	print(selectedEnemies)
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()
	
	trackBattle()

func attackEnemy(enemy):
	print(enemy.enemyData.enemy_name + " clicked fr")
	enemy.enemyData.current_hp -= 5
	enemy.updateHealth()

func processAttacks():
	for i in range(4):
		if selectedEnemies[i].move == 1:
			selectedEnemies[i].target.enemyData.current_hp -= selectedEnemies[i].source.attack_damage
			selectedEnemies[i].target.updateHealth()
		# this statement checks if this is a skill move
		if selectedEnemies[i].move == 2:
			# this statement checks if this is an attack skill move
			if selectedEnemies[i].skill.type == 0:
				selectedEnemies[i].target.enemyData.current_hp -= selectedEnemies[i].skill.damage_cal
				selectedEnemies[i].source.cur_hp -= selectedEnemies[i].skill.hp_cost
				selectedEnemies[i].source.cur_mp -= selectedEnemies[i].skill.mp_cost
				selectedEnemies[i].target.updateHealth()
			# this statement checks if this is a heal move
			if selectedEnemies[i].skill.type == 1:
				selectedEnemies[i].friendlyTarget.cur_hp += selectedEnemies[i].skill.heal_cal
				selectedEnemies[i].source.cur_hp -= selectedEnemies[i].skill.hp_cost
				selectedEnemies[i].source.cur_mp -= selectedEnemies[i].skill.mp_cost
			# this statement checks if this is an buff move
			if selectedEnemies[i].skill.type == 2:
				selectedEnemies[i].friendlyTarget.cur_hp *= selectedEnemies[i].skill.buff_value
				selectedEnemies[i].source.cur_hp -= selectedEnemies[i].skill.hp_cost
				selectedEnemies[i].source.cur_mp -= selectedEnemies[i].skill.mp_cost
			# this statement checks if this is a debuff move
			if selectedEnemies[i].skill.type == -2:
				selectedEnemies[i].target.enemyData.current_hp *= selectedEnemies[i].skill.buff_value
				selectedEnemies[i].source.cur_hp -= selectedEnemies[i].skill.hp_cost
				selectedEnemies[i].source.cur_mp -= selectedEnemies[i].skill.mp_cost
				selectedEnemies[i].target.updateHealth()
		if selectedEnemies[i].move == 3:
			# Check if it is consumable item
			if selectedEnemies[i].itemInUse.type == 0:
				selectedEnemies[i].friendlyTarget.cur_hp += selectedEnemies[i].itemInUse.hp_heal
			# Check if it is modifier itemd
			if selectedEnemies[i].itemInUse.type == 1:
				selectedEnemies[i].friendlyTarget.strength += selectedEnemies[i].itemInUse.modify_strength
				selectedEnemies[i].friendlyTarget.agility += selectedEnemies[i].itemInUse.modify_agility
				selectedEnemies[i].friendlyTarget.intelligence += selectedEnemies[i].itemInUse.modify_intelligence
				print(selectedEnemies[i].friendlyTarget.strength)
				print(selectedEnemies[i].friendlyTarget.agility)
				print(selectedEnemies[i].friendlyTarget.intelligence)
			# Check if it is an attack item
			if selectedEnemies[i].itemInUse.type == 2:
				selectedEnemies[i].target.enemyData.current_hp -= selectedEnemies[i].itemInUse.damage
				selectedEnemies[i].target.updateHealth()
	updateBattleGroupHealth()
	typeOfMove = 0
	Global.friendlyOrNot = -1


func updateBattleGroupHealth():
	player0.updateHealth()
	player1.updateHealth()
	player2.updateHealth()
	player3.updateHealth()

func updatePlayerCounter():
	currentPlayerCounter += 1
	
	if player0 == null and currentPlayerCounter == 0:
		currentPlayerCounter += 1
	elif player1 == null and currentPlayerCounter == 1:
		currentPlayerCounter += 1
	elif player2 == null and currentPlayerCounter == 2:
		currentPlayerCounter += 1
	elif player3 == null and currentPlayerCounter == 3:
		currentPlayerCounter += 1
	
	if currentPlayerCounter >= 4:
		processAttacks()
		currentPlayerCounter = 0


func _on_player_0_pressed():
	if typeOfMove == 2 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[0]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	if typeOfMove == 3 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[0]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	
	typeOfMove = -1

func _on_player_1_pressed():
	if typeOfMove == 2 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[1]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	if typeOfMove == 3 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[1]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	
	typeOfMove = -1

func _on_player_2_pressed():
	if typeOfMove == 2 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[2]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	if typeOfMove == 3 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[2]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	typeOfMove = -1

func _on_player_3_pressed():
	if typeOfMove == 2 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[3]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	if typeOfMove == 3 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[2]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
		
	typeOfMove = -1
