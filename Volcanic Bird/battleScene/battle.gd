extends Control

var copies = [null, null, null, null]

# 4 party members max
var player0 = null
var player1 = null
var player2 = null
var player3 = null

var samepleCreature1

var isBattling = false
var theEnd = false

# Array for storing the attacks
# Indices are the players (0-3)
# Values are the selected enemies (0-3)
# 	0 is for not attacking
# 	1-3 is for the enemy node
var selectedEnemies = [null, null, null, null]
var selectedCreatures = [null, null, null, null]
var movesArray = []

var currentMoveIndex = 0
var processMove = false

# 1 = attack
# 2 = skill
# 3 = item
var typeOfMove = 0

# Array for storing the party members defending
# Indices are the players (0-3)
# Values are the references
# 	a null is for not defending
# 	a reference is for defending
var defendingPlayers = [null, null, null, null]

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
	$Background.set_texture(load(Global.background))
	# comment this function to load sample creatures from the main menu scene while save battle data
	# uncomment this function to load sample creatures from the battle scene while not saving battle data 
	# setupSampleGroup() # testing purposes
	setupSampleEnemy() # testing purposes
	connectSignals()
	hideEnemyButtons()
	getPlayerInfo()
	getEnemyInfo()
	loadCreatures() 
	loadEnemies()
	initializeMoves()
	sortArrayBySpeed()
	copyCreatures()
	hideCreatureDamageRects()
	print(enemy1.enemyData)
	print(enemy2.enemyData)
	print(enemy3.enemyData)
	
	currentPlayerCounter = 0
	currentEnemyCounter = 0
	
	trackBattle()

func hideCreatureDamageRects():
	player0.get_node("Damaged").hide()
	player1.get_node("Damaged").hide()
	player2.get_node("Damaged").hide()
	player3.get_node("Damaged").hide()

func copyCreatures():
	for i in range(4):
		var tempCreature = Creatures.new()
		tempCreature.initializeCreature(Global.battleGroup[i])
		copies[i] = tempCreature

# Resetting the buffs so it doesn't overstack
func resetCreatures():
	for i in range(4):
		Global.battleGroup[i].defense = copies[i].defense
		Global.battleGroup[i].magic_defense = copies[i].magic_defense
		Global.battleGroup[i].attack_damage = copies[i].attack_damage
		Global.battleGroup[i].magic_attack_damage = copies[i].magic_attack_damage

# This is an implementation of selection sort
func basicSort():
	for i in range(7):
		var maximumIndex = i
		
		for j in range(i + 1, 7):
			if movesArray[j].isEnemy == 1 and movesArray[maximumIndex].isEnemy == 1:
				if movesArray[maximumIndex].enemySource.enemyData.speed < movesArray[j].enemySource.enemyData.speed:
					maximumIndex = j
			elif movesArray[j].isEnemy == 0 and movesArray[maximumIndex].isEnemy == 0:
				if movesArray[maximumIndex].source.speed < movesArray[j].source.speed:
					maximumIndex = j
			elif movesArray[j].isEnemy == 0 and movesArray[maximumIndex].isEnemy == 1:
				if movesArray[maximumIndex].enemySource.enemyData.speed < movesArray[j].source.speed:
					maximumIndex = j
			elif movesArray[j].isEnemy == 1 and movesArray[maximumIndex].isEnemy == 0:
				if movesArray[maximumIndex].source.speed < movesArray[j].enemySource.enemyData.speed:
					maximumIndex = j
		# Swap the biggest element
		var temp = movesArray[maximumIndex]
		movesArray[maximumIndex] = movesArray[i]
		movesArray[i] = temp

func connectSignals():
	Global.connect("skillObtained", closePanelAndShowEnemiesSkills)
	Global.connect("itemObtained", closePanelAndShowAlliesItems)

func closePanelAndShowEnemiesSkills():
	if ((selectedEnemies[currentPlayerCounter].source.cur_mp >= Global.clickedSkill.mp_cost and Global.clickedSkill.mp_cost != 0) and (selectedEnemies[currentPlayerCounter].source.cur_hp >= Global.clickedSkill.hp_cost and Global.clickedSkill.hp_cost != 0)):
		if Global.friendlyOrNot == 0:
			print("mp hp")
			$"Skill List Panel".hide()
			showTextBox("Which enemy?")
			showEnemyButtons()
			return
		elif Global.friendlyOrNot == 1:
			$"Skill List Panel".hide()
			showTextBox("Which ally?")
			return
	elif ((selectedEnemies[currentPlayerCounter].source.cur_mp < Global.clickedSkill.mp_cost and Global.clickedSkill.mp_cost != 0) or (selectedEnemies[currentPlayerCounter].source.cur_hp < Global.clickedSkill.hp_cost and Global.clickedSkill.hp_cost != 0)):
		return
	elif (selectedEnemies[currentPlayerCounter].source.cur_mp >= Global.clickedSkill.mp_cost) and (Global.clickedSkill.mp_cost != 0):
		if Global.friendlyOrNot == 0:
			print("mp")
			$"Skill List Panel".hide()
			showTextBox("Which enemy?")
			showEnemyButtons()
			return
		elif Global.friendlyOrNot == 1:
			$"Skill List Panel".hide()
			showTextBox("Which ally?")
			return
	elif (selectedEnemies[currentPlayerCounter].source.cur_hp >= Global.clickedSkill.hp_cost) and (Global.clickedSkill.hp_cost != 0):
		if Global.friendlyOrNot == 0:
			print("hp")
			$"Skill List Panel".hide()
			showTextBox("Which enemy?")
			showEnemyButtons()
			return
		elif Global.friendlyOrNot == 1:
			$"Skill List Panel".hide()
			showTextBox("Which ally?")
		return
	Global.clickedSkill = null
	print(Global.clickedSkill)

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
	for i in range(3):
		var enemy = load(Global.selected_enemy_paths[i])
		var loadEnemy = EnemyData.new()
		loadEnemy.initializeEnemyData(enemy)
		sampleArray.append(loadEnemy)
  
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
		currentMove.isEnemy = 0
		selectedEnemies[i] = currentMove
	
	# Manually Initialize Enemies
	var currentMove = Moves.new()
	currentMove.move = 0
	currentMove.enemySource = enemy1
	currentMove.enemyTarget = null
	currentMove.isEnemy = 1
	selectedCreatures[0] = currentMove
	
	currentMove = Moves.new()
	currentMove.move = 0
	currentMove.enemySource = enemy2
	currentMove.enemyTarget = null
	currentMove.isEnemy = 1
	selectedCreatures[1] = currentMove
	
	currentMove = Moves.new()
	currentMove.move = 0
	currentMove.enemySource = enemy3
	currentMove.enemyTarget = null
	currentMove.isEnemy = 1
	selectedCreatures[2] = currentMove
 
func sortArrayBySpeed():
	for i in range(4):
		movesArray.append(selectedEnemies[i])
	for i in range(3):
		movesArray.append(selectedCreatures[i])
	
	basicSort()
	
	for i in range(7):
		if movesArray[i].isEnemy == 1:
			print(movesArray[i].enemySource.enemyData.speed)
			print(movesArray[i].enemySource.enemyData.enemy_name)
		elif movesArray[i].isEnemy == 0:
			print(movesArray[i].source.speed)
			print(movesArray[i].source.name)

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
	$"Party Panel/Party Container/BackButton".disabled = false
	
	# Check if the player's party has been defeated
	if partyIsDead():
		print("Party is dead")
		updateTextBox("Your party has been defeated!")
		await get_tree().create_timer(3).timeout
		updateTextBox("You ran away...")
		await get_tree().create_timer(3).timeout
		deleteCreaturesAndItems()
		if Global.creatureStorage.is_empty():
			print("Game over pls implement game over scene")
			get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
		else:
			get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
	
	# Check if the enemies are dead
	if (enemy1.enemyData.isDead && enemy2.enemyData.isDead && enemy3.enemyData.isDead):
		# Change music
		$"Party Panel/Party Container/BackButton".disabled = true
		$"Battle Music".playing = false
		$"Victory Music".play()
		
		print("Enemies are dead")
		updateTextBox("You and your party won!")
		resetCreatures()
		disableButtons()
		Global.eventCompleted = true
		
		await get_tree().create_timer(1.5).timeout # pause the game for 1.5 seconds
		
		# Update the text labels in the results scene
		updateResultsTextBox(player0, 0, player0.creatureData.name, player0.creatureData.level, player0.creatureData.experience)
		updateResultsTextBox(player1, 1, player1.creatureData.name, player1.creatureData.level, player1.creatureData.experience)
		updateResultsTextBox(player2, 2, player2.creatureData.name, player2.creatureData.level, player2.creatureData.experience)
		updateResultsTextBox(player3, 3, player3.creatureData.name, player3.creatureData.level, player3.creatureData.experience)
		$"Results".show() # display results scene
		
		# Add items to the player's inventory
		updateInventory()
		
		await get_tree().create_timer(4.5).timeout # pause the game for 4.5 seconds
		get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn") # go to the hub menu scene
		return
	
	if currentPlayerCounter == 0:
		if !player0.creatureData.isDead:
			print("Player 0's Turn")
			updateTextBox("It is " + player0.creatureData.name + "'s turn")
			hideAllColorRects()
			$"Party Panel/Party Container/Player0/ColorRect".show()
		else:
			updatePlayerCounter()
	if currentPlayerCounter == 1:
		if !player1.creatureData.isDead:
			print("Player 1's Turn")
			updateTextBox("It is " + player1.creatureData.name + "'s turn")
			hideAllColorRects()
			$"Party Panel/Party Container/Player1/ColorRect".show()
		else:
			updatePlayerCounter()
	if currentPlayerCounter == 2:
		if !player2.creatureData.isDead:
			print("Player 2's Turn")
			updateTextBox("It is " + player2.creatureData.name + "'s turn")
			hideAllColorRects()
			$"Party Panel/Party Container/Player2/ColorRect".show()
		else:
			updatePlayerCounter()
	if currentPlayerCounter == 3:
		if !player3.creatureData.isDead:
			print("Player 3's Turn")
			updateTextBox("It is " + player3.creatureData.name + "'s turn")
			hideAllColorRects()
			$"Party Panel/Party Container/Player3/ColorRect".show()
		else:
			updatePlayerCounter()

func deleteCreaturesAndItems():
	Global.itemInventory.clear()
	
	var creatureOne = Global.battleGroup[0] 
	var creatureTwo = Global.battleGroup[1]
	var creatureThree = Global.battleGroup[2]
	var creatureFour = Global.battleGroup[3]
	Global.creatureStorage.erase(creatureOne)
	Global.creatureStorage.erase(creatureTwo)
	Global.creatureStorage.erase(creatureThree)
	Global.creatureStorage.erase(creatureFour)
	
	for i in range(4):
		Global.battleGroup[i] = null

func partyIsDead():
	return player0.creatureData.isDead && player1.creatureData.isDead && player2.creatureData.isDead && player3.creatureData.isDead

func hideAllColorRects():
	$"Party Panel/Party Container/Player0/ColorRect".hide()
	$"Party Panel/Party Container/Player1/ColorRect".hide()
	$"Party Panel/Party Container/Player2/ColorRect".hide()
	$"Party Panel/Party Container/Player3/ColorRect".hide()

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
	var oneSkillExists = false
	for node in $"Skill List Panel/Skill List Container".get_children():
		if Global.battleGroup[currentPlayerCounter].skillList.size() != 0:
			if Global.battleGroup[currentPlayerCounter].level >= Global.battleGroup[currentPlayerCounter].skillList[index].unlockLevel:
				oneSkillExists = true
				node.skill = Global.battleGroup[currentPlayerCounter].skillList[index]
				node.emit_signal("updateSkillButton")
				node.show()
			index += 1
			if index >= Global.battleGroup[currentPlayerCounter].skillList.size():
				break
	if oneSkillExists:
		$"Skill List Panel".show()
		showTextBox("Which Skill?")

func _on_defend_pressed():
	print("Defend Button Pressed")
	
	if currentPlayerCounter == 0:
		defendingPlayers[currentPlayerCounter] = player0
	elif currentPlayerCounter == 1:
		defendingPlayers[currentPlayerCounter] = player1
	elif currentPlayerCounter == 2:
		defendingPlayers[currentPlayerCounter] = player2
	elif currentPlayerCounter == 3:
		defendingPlayers[currentPlayerCounter] = player3
	
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
	var oneItemExists = false
	if Global.itemInventory.size() != 0:
		for node in $"Item List Panel/Item List Container".get_children():
			if Global.itemInventory[index].inUse == false:
				oneItemExists = true
				node.Item = Global.itemInventory[index]
				node.emit_signal("updateItemButton")
				node.show()
			index += 1
			if index >= Global.itemInventory.size():
				break
		if oneItemExists:
			$"Item List Panel".show()
			showTextBox("Which Item")

func _on_run_pressed():
	var rng = RandomNumberGenerator.new()
	var randomNumber = rng.randi_range(1, 100)
	Global.eventCompleted = false
	
	print(randomNumber)
	resetCreatures()
	# Low Chance: Party escapes unharmed
	if randomNumber >= 1 && randomNumber <= 20:
		showTextBox("You and your party ran away.")
	
	# High Chance: Party escapes with hp damage
	elif randomNumber >= 21 && randomNumber <= 100:
		player0.creatureData.decreaseHealth(5)
		player1.creatureData.decreaseHealth(5)
		player2.creatureData.decreaseHealth(5)
		player3.creatureData.decreaseHealth(5)
		
		player0.updateHealth()
		player1.updateHealth()
		player2.updateHealth()
		player3.updateHealth()
		
		if partyIsDead():
			updateTextBox("Your party loses 5 HP and has been defeated!\n")
			await get_tree().create_timer(3).timeout
			updateTextBox("You ran away...")
			deleteCreaturesAndItems()
			await get_tree().create_timer(3).timeout
		else:
			showTextBox("Your party loses 5 HP!\nYou and your party ran away.")
		
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

func updateResultsTextBox(player, playerIndex: int, playerName: String, playerLevel: int, playerExperience: int):
	var initialLevel = playerLevel
	playerExperience += calculateExperience(playerLevel)
	var nextLevelExperience = calculateExperience(playerLevel + 1)
	var hasLeveledUp = false
	var skillsLearned = ""
	
	# Update the creature's level
	while playerExperience >= nextLevelExperience:
		playerLevel += 1
		player.creatureData.levelUp()
		nextLevelExperience = calculateExperience(playerLevel + 1)
		hasLeveledUp = true
	
	if hasLeveledUp:
		player.creatureData.cur_hp = player.creatureData.max_hp
		player.creatureData.cur_mp = player.creatureData.max_mp
		player.creatureData.isDead = false
		playerExperience -= calculateExperience(playerLevel)
	
	# Keep track of unlocked skills
	var index = 0
	for currentSkill in Global.battleGroup[playerIndex].skillList:
		if Global.battleGroup[playerIndex].skillList.size() == 0:
			break
		
		if initialLevel < currentSkill.unlockLevel && playerLevel >= currentSkill.unlockLevel:
			skillsLearned += currentSkill.nameLabel + "\n"
		
		index += 1
		
		if index >= Global.battleGroup[playerIndex].skillList.size():
			break
	
	var levelStr = str(initialLevel) if (initialLevel == playerLevel) else (str(initialLevel) + "->" + str(playerLevel))
	var skillsLearnedStr = ("Obtained Skills:\n" + str(skillsLearned)) if (skillsLearned != "") else ""
	
	$"Results/Panel/HBoxContainer/".get_child(playerIndex).get_child(0).text = playerName + "\n" + \
	"Level " + levelStr + "\n" + \
	"To Next: " + str(playerExperience) + "/" + str(calculateExperience(playerLevel + 1)) + "\n" + \
	skillsLearnedStr
	
	player.creatureData.setExperience(playerExperience)
	player.creatureData.setLevel(playerLevel)

func calculateExperience(playerLevel: int):
	var exp = ceil((4 * playerLevel ** 3 / 5.0))
	return ceil(exp)

func updateInventory():
	var rng = RandomNumberGenerator.new()
	
	for node in $"Enemies Container".get_children():
		if node.enemyData.asset == null:
			print("Dummy enemy found")
			continue
		
		# Calculate item drop rng:
		# 80% is for common items
		# 20% is for rare items
		var randomNum = rng.randi_range(1, 100)
		print(randomNum)
		
		if randomNum <= 100 && randomNum >= 21: # Common Item
			randomNum = rng.randi_range(0, Global.commonItemsMaster.size() - 1)
			
			if Global.itemInventory.size() < 12:
				var tempItem = Item.new()
				tempItem.initializeItem(Global.commonItemsMaster[randomNum])
				Global.itemInventory.append(tempItem)
				updateTextBox("You found " + Global.commonItemsMaster[randomNum].nameLabel + "!")
			else:
				var tempItem = Item.new()
				tempItem.initializeItem(Global.commonItemsMaster[randomNum])
				Global.itemStorage.append(tempItem)
				updateTextBox("You found " + Global.commonItemsMaster[randomNum].nameLabel + "!" + "\n" + "It has been placed into the storage")
		else: # Rare Item
			randomNum = rng.randi_range(0, Global.rareItemsMaster.size() - 1)
			
			if Global.itemInventory.size() < 12:
				var tempItem = Item.new()
				tempItem.initializeItem(Global.rareItemsMaster[randomNum])
				Global.itemInventory.append(tempItem)
				updateTextBox("You found " + Global.rareItemsMaster[randomNum].nameLabel + "!")
			else:
				var tempItem = Item.new()
				tempItem.initializeItem(Global.rareItemsMaster[randomNum])
				Global.itemStorage.append(tempItem)
				updateTextBox("You found " + Global.rareItemsMaster[randomNum].nameLabel + "!" + "\n" + "It has been placed into the storage")
		
		await get_tree().create_timer(1.5).timeout # pause the game for 1.5 seconds

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
	if !enemy1.enemyData.isDead:
		$"Enemies Container/Enemy1/Button".show()
	if !enemy2.enemyData.isDead:
		$"Enemies Container/Enemy2/Button".show()
	if !enemy3.enemyData.isDead:
		$"Enemies Container/Enemy3/Button".show()

func _on_enemy1_pressed():
	# attackEnemy(enemy1)
	selectedEnemies[currentPlayerCounter].target = enemy1
	selectedEnemies[currentPlayerCounter].move = typeOfMove
	
	if typeOfMove == 2 and Global.clickedSkill != null:
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
	if typeOfMove == 3:
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		Global.clickedItem.inUse = true
		
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
	
	if typeOfMove == 2 and Global.clickedSkill != null:
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
	if typeOfMove == 3:
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		Global.clickedItem.inUse = true
	
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
	
	if typeOfMove == 2 and Global.clickedSkill != null:
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
	if typeOfMove == 3:
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		Global.clickedItem.inUse = true
	
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
	# Execute all moves in the order they occur
	var bh = BattleHelper.new(movesArray)
	bh.processBattle()
	
	updateBattleGroupHealth()
	typeOfMove = 0
	Global.friendlyOrNot = -1
	showButtons()
	hideTextBox()

func processAttacksOld():
	$"Party Panel/Party Container/BackButton".disabled = true
	hideEnemyButtons()
	for i in range(7):
		print("enemy one " + str(enemy1.enemyData.isDead))
		print("enemy two " + str(enemy1.enemyData.isDead))
		print("enemy three " + str(enemy1.enemyData.isDead))
		if movesArray[i].isEnemy == 0:
			if movesArray[i].target != null and movesArray[i].target.enemyData.isDead: # skip player turns if the enemy is dead 
				continue
			elif !movesArray[i].source.isDead:
				if movesArray[i].move == 1:
					var currentDamage = max(1, movesArray[i].source.attack_damage / movesArray[i].target.enemyData.defense)
					
					movesArray[i].target.enemyData.current_hp -= currentDamage
					movesArray[i].target.updateHealth()
					movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
					updateBattleGroupHealth()
					
					showTextBox(str(movesArray[i].source.name) + " dealt " + str(int(currentDamage)) + " damage to " + str(movesArray[i].target.enemyData.enemy_name))
					await get_tree().create_timer(1.5).timeout
				# this statement checks if this is a skill move
				if movesArray[i].move == 2:
					# this statement checks if this is a constant damage skill move
					if movesArray[i].skill.type == 0:
						movesArray[i].target.enemyData.current_hp -= movesArray[i].skill.damage_cal
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " on " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(movesArray[i].skill.damage_cal))
						await get_tree().create_timer(1.5).timeout
					# this statement checks if this is a heal move
					if movesArray[i].skill.type == 1:
						if !movesArray[i].friendlyTarget.isDead:
							movesArray[i].friendlyTarget.cur_hp += movesArray[i].skill.heal_cal
							movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
							movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
							updateBattleGroupHealth()
							showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to heal " + str(movesArray[i].friendlyTarget.name) + " and healed for " + str(movesArray[i].skill.heal_cal))
							await get_tree().create_timer(1.5).timeout
						else:
							showTextBox(str(movesArray[i].source.name) + " tried to heal " + str(movesArray[i].friendlyTarget.name) + " but they're dead!!")
							await get_tree().create_timer(1.5).timeout
					# this statement checks if this is an buff move
					if movesArray[i].skill.type == 2:
						if !movesArray[i].friendlyTarget.isDead:
							movesArray[i].friendlyTarget.defense *= movesArray[i].skill.buff_value
							movesArray[i].friendlyTarget.magic_defense *= movesArray[i].skill.buff_value
							movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
							movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
							updateBattleGroupHealth()
							showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to buff " + str(movesArray[i].friendlyTarget.name) + "'s defenses for " + str(movesArray[i].skill.buff_value))
							await get_tree().create_timer(1.5).timeout
						else:
							showTextBox(str(movesArray[i].source.name) + " tried to buff " + str(movesArray[i].friendlyTarget.name) + " but they're dead!!")
							await get_tree().create_timer(1.5).timeout
					# this statement checks if this is a debuff move
					if movesArray[i].skill.type == -2:
						movesArray[i].target.enemyData.defense *= movesArray[i].skill.buff_value
						movesArray[i].target.enemyData.magic_defense *= movesArray[i].skill.buff_value
						if movesArray[i].target.enemyData.defense <= 0:
							movesArray[i].target.enemyData.defense = 1
						if movesArray[i].target.enemyData.magic_defense <= 0:
							movesArray[i].target.enemyData.magic_defense = 1
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to debuff " + str(movesArray[i].target.enemyData.enemy_name) + "'s defenses for " + str(movesArray[i].skill.buff_value))
						await get_tree().create_timer(1.5).timeout
					# this statement checks if this is a calculated physical damage move
					if movesArray[i].skill.type == 3:
						var currentDamage = max(1, movesArray[i].source.attack_damage * movesArray[i].skill.damage_cal / movesArray[i].target.enemyData.defense)
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(int(currentDamage)))
						await get_tree().create_timer(1.5).timeout
					# this statement checks if this is a calculated magical damage move
					if movesArray[i].skill.type == 4:
						var currentDamage = max(1, movesArray[i].source.magic_attack_damage * movesArray[i].skill.damage_cal / movesArray[i].target.enemyData.magic_defense)
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(int(currentDamage)))
						await get_tree().create_timer(1.5).timeout
					# spread physical
					if movesArray[i].skill.type == 5:
						var outgoingDamage = movesArray[i].source.attack_damage * movesArray[i].skill.damage_cal
						print(movesArray[i].source.attack_damage)
						print(movesArray[i].skill.damage_cal)
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						for node in $"Enemies Container".get_children():
							print(outgoingDamage)
							print(outgoingDamage / node.enemyData.defense)
							node.enemyData.current_hp -= outgoingDamage / node.enemyData.defense
							node.updateHealth()
							node.get_node("AnimationPlayer").play("enemy_damaged")
						updateBattleGroupHealth()
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to damage all enemies!!")
						await get_tree().create_timer(1.5).timeout
					# spread magic
					if movesArray[i].skill.type == 6:
						var outgoingDamage = movesArray[i].source.magic_attack_damage * movesArray[i].skill.damage_cal
						print(movesArray[i].source.magic_attack_damage)
						print(movesArray[i].skill.damage_cal)
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						for node in $"Enemies Container".get_children():
							print(outgoingDamage)
							print(outgoingDamage / node.enemyData.magic_defense)
							node.enemyData.current_hp -= outgoingDamage / node.enemyData.magic_defense
							node.updateHealth()
							node.get_node("AnimationPlayer").play("enemy_damaged")
						updateBattleGroupHealth()
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to damage all enemies!!")
						await get_tree().create_timer(1.5).timeout
					# lifesteal physical damage
					if movesArray[i].skill.type == 7:
						var currentDamage = max(1, movesArray[i].source.attack_damage * movesArray[i].skill.damage_cal / movesArray[i].target.enemyData.defense)
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						# lifesteal effect, heals half damage dealt
						movesArray[i].source.cur_hp += currentDamage / 2
						updateBattleGroupHealth()
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(int(currentDamage)))
						await get_tree().create_timer(1.5).timeout
					# manasteal magic damage
					if movesArray[i].skill.type == 8:
						var currentDamage = max(1, movesArray[i].source.magic_attack_damage * movesArray[i].skill.damage_cal / movesArray[i].target.enemyData.magic_defense)
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						# manasteal effect, heals half damage dealt
						movesArray[i].source.cur_mp += currentDamage / 2
						updateBattleGroupHealth()
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(int(currentDamage)))
						await get_tree().create_timer(1.5).timeout
					# spread heal
					if movesArray[i].skill.type == 9:
						for creature in Global.battleGroup:
							if !creature.isDead:
								creature.cur_hp += movesArray[i].skill.heal_cal
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to heal the party for " + str(movesArray[i].skill.heal_cal))
						updateBattleGroupHealth()
						await get_tree().create_timer(1.5).timeout
					# buff magic damage
					if movesArray[i].skill.type == 10:
						if !movesArray[i].friendlyTarget.isDead:
							movesArray[i].friendlyTarget.magic_attack_damage *= movesArray[i].skill.buff_value
							movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
							movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
							updateBattleGroupHealth()
							showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to buff " + str(movesArray[i].friendlyTarget.name) + "'s magic for " + str(movesArray[i].skill.buff_value))
							await get_tree().create_timer(1.5).timeout
						else:
							showTextBox(str(movesArray[i].source.name) + " tried to buff " + str(movesArray[i].friendlyTarget.name) + " but they're dead!!")
							await get_tree().create_timer(1.5).timeout
					# debuff magic damage
					if movesArray[i].skill.type == -10:
						movesArray[i].target.enemyData.magic_attack_damage *= movesArray[i].skill.buff_value
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to debuff " + str(movesArray[i].target.enemyData.enemy_name) + "'s magic for " + str(movesArray[i].skill.buff_value))
						await get_tree().create_timer(1.5).timeout
					# buff physical damage
					if movesArray[i].skill.type == 11:
						if !movesArray[i].friendlyTarget.isDead:
							movesArray[i].friendlyTarget.attack_damage *= movesArray[i].skill.buff_value
							movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
							movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
							updateBattleGroupHealth()
							showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to buff " + str(movesArray[i].friendlyTarget.name) + "'s attack for " + str(movesArray[i].skill.buff_value))
							await get_tree().create_timer(1.5).timeout
						else:
							showTextBox(str(movesArray[i].source.name) + " tried to buff " + str(movesArray[i].friendlyTarget.name) + " but they're dead!!")
							await get_tree().create_timer(1.5).timeout
					# debuff physical damage
					if movesArray[i].skill.type == -11:
						movesArray[i].target.enemyData.attack_damage *= movesArray[i].skill.buff_value
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to debuff " + str(movesArray[i].target.enemyData.enemy_name) + "'s attack for " + str(movesArray[i].skill.buff_value))
						await get_tree().create_timer(1.5).timeout
					# calculated physical+magic damage, pierce defenses
					if movesArray[i].skill.type == 12:
						var currentDamage = max(1, ((movesArray[i].source.attack_damage * movesArray[i].skill.damage_cal) + (movesArray[i].source.magic_attack_damage * movesArray[i].skill.damage_cal)))
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(currentDamage))
						await get_tree().create_timer(1.5).timeout
					# calculated physical+speed damage, pierce defenses
					if movesArray[i].skill.type == 13:
						var currentDamage = max(1, ((movesArray[i].source.attack_damage * movesArray[i].skill.damage_cal) + (movesArray[i].source.speed * movesArray[i].skill.damage_cal)))
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(currentDamage))
						await get_tree().create_timer(1.5).timeout
					# calculated magic+speed damage, pierce defenses
					if movesArray[i].skill.type == 14:
						var currentDamage = max(1, ((movesArray[i].source.speed * movesArray[i].skill.damage_cal) + (movesArray[i].source.magic_attack_damage * movesArray[i].skill.damage_cal)))
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(currentDamage))
						await get_tree().create_timer(1.5).timeout
					# calculated speed damage, pierce defenses
					if movesArray[i].skill.type == 15:
						var currentDamage = max(1, movesArray[i].source.speed * movesArray[i].skill.damage_cal)
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(currentDamage))
						await get_tree().create_timer(1.5).timeout
					# calculated physical+magical+speed damage, pierce defenses
					if movesArray[i].skill.type == 16:
						var currentDamage = max(1, ((movesArray[i].source.attack_damage * movesArray[i].skill.damage_cal) + (movesArray[i].source.speed * movesArray[i].skill.damage_cal) + (movesArray[i].source.magic_attack_damage * movesArray[i].skill.damage_cal)))
						movesArray[i].target.enemyData.current_hp -= currentDamage
						movesArray[i].source.cur_hp -= movesArray[i].skill.hp_cost
						movesArray[i].source.cur_mp -= movesArray[i].skill.mp_cost
						updateBattleGroupHealth()
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].skill.nameLabel) + " to " + str(movesArray[i].target.enemyData.enemy_name) + " and dealt " + str(currentDamage))
						await get_tree().create_timer(1.5).timeout
				if movesArray[i].move == 3:
					# Check if it is consumable item
					if movesArray[i].itemInUse.type == 0:
						if !movesArray[i].friendlyTarget.isDead:
							movesArray[i].friendlyTarget.cur_hp += movesArray[i].itemInUse.hp_heal
							updateBattleGroupHealth()
							showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].itemInUse.nameLabel) + " to heal " + str(movesArray[i].friendlyTarget.name) + " and healed for " + str(movesArray[i].itemInUse.hp_heal))
							Global.itemInventory.erase(movesArray[i].itemInUse)
							await get_tree().create_timer(1.5).timeout
						else:
							showTextBox(str(movesArray[i].source.name) + " tried to heal " + str(movesArray[i].friendlyTarget.name) + " but they're dead!!")
							await get_tree().create_timer(1.5).timeout
					# Check if it is modifier item
					# This needs to be changed after we implement proper buff techniques
					if movesArray[i].itemInUse.type == 1:
						if !movesArray[i].friendlyTarget.isDead:
							movesArray[i].friendlyTarget.defense *= movesArray[i].itemInUse.modify_defense
							movesArray[i].friendlyTarget.magic_defense *= movesArray[i].itemInUse.modify_magic_defense
							updateBattleGroupHealth()
							showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].itemInUse.nameLabel) + " to buff " + str(movesArray[i].friendlyTarget.name) + " and buffed for " + str(movesArray[i].itemInUse.modify_strength))
							Global.itemInventory.erase(movesArray[i].itemInUse)
							await get_tree().create_timer(1.5).timeout
						else:
							showTextBox(str(movesArray[i].source.name) + " tried to buff " + str(movesArray[i].friendlyTarget.name) + " but they're dead!!")
							await get_tree().create_timer(1.5).timeout
					# Check if it is an attack item
					if movesArray[i].itemInUse.type == 2:
						movesArray[i].target.enemyData.current_hp -= movesArray[i].itemInUse.damage
						movesArray[i].target.updateHealth()
						movesArray[i].target.get_node("AnimationPlayer").play("enemy_damaged")
						showTextBox(str(movesArray[i].source.name) + " used " + str(movesArray[i].itemInUse.nameLabel) + " to damage " + str(movesArray[i].target.enemyData.enemy_name) + " and damaged for " + str(movesArray[i].itemInUse.damage))
						Global.itemInventory.erase(movesArray[i].itemInUse)
						await get_tree().create_timer(1.5).timeout
		if movesArray[i].isEnemy == 1:
			if !movesArray[i].enemySource.enemyData.isDead:
				var targetIsDefending = false
				var currentDamage = 0
				print("hi")
				# check if the target is defending
				for j in range (4):
					if defendingPlayers[j] != null && movesArray[i].enemyTarget == defendingPlayers[j].creatureData:
						targetIsDefending = true
				
				if targetIsDefending:
					currentDamage = movesArray[i].enemyTarget.defend(movesArray[i].enemySource.enemyData.damage)
				else:
					# Physical enemy attack
					if movesArray[i].enemySource.enemyData.useMagic == false:
						currentDamage = max(1, movesArray[i].enemySource.enemyData.damage / movesArray[i].enemyTarget.defense)
					elif movesArray[i].enemySource.enemyData.useMagic == true:
						print("weak magic defense lol")
						currentDamage = max(1, movesArray[i].enemySource.enemyData.magic_damage / movesArray[i].enemyTarget.magic_defense)
				
				$"Attack".play()
				movesArray[i].enemyTarget.cur_hp -= currentDamage
				playCreatureDamaged(movesArray[i].enemyTarget)
				updateBattleGroupHealth()
				showTextBox(str(movesArray[i].enemySource.enemyData.enemy_name) + " dealt " + str(currentDamage) + " damage to " + str(movesArray[i].enemyTarget.name))
				await get_tree().create_timer(1.5).timeout
		
	updateBattleGroupHealth()
	resetMoves()
	resetEnemyMoves()
	isBattling = false
	theEnd = true
	typeOfMove = 0
	currentMoveIndex = 0
	Global.friendlyOrNot = -1
	defendingPlayers = [null, null, null, null]
	showButtons()
	hideTextBox()

func playCreatureDamaged(target):
	if target == Global.battleGroup[0]:
		player0.get_node("Damaged").show()
		player0.get_node("AnimationPlayer").play("creature_damaged")
	if target == Global.battleGroup[1]:
		player1.get_node("Damaged").show()
		player1.get_node("AnimationPlayer").play("creature_damaged")
	if target == Global.battleGroup[2]:
		player2.get_node("Damaged").show()
		player2.get_node("AnimationPlayer").play("creature_damaged")
	if target == Global.battleGroup[3]:
		player3.get_node("Damaged").show()
		player3.get_node("AnimationPlayer").play("creature_damaged")

func _process(delta):
	if currentPlayerCounter >= 4 and not isBattling:
		hideAllColorRects()
		isBattling = true
		selectEnemyMoves()
		processAttacksOld()
		currentPlayerCounter = 0
	if theEnd:
		theEnd = false
		trackBattle()

func updateBattleGroupHealth():
	player0.updateHealth()
	player1.updateHealth()
	player2.updateHealth()
	player3.updateHealth()

func updatePlayerCounter():
	currentPlayerCounter += 1

func resetEnemyMoves():
	for i in range(7):
		if movesArray[i].isEnemy == 1:
			movesArray[i].enemyTarget = null
			movesArray[i].enemySource.enemyData.useMagic = false

func selectEnemyMoves():
	for i in range(7):
		if movesArray[i].isEnemy == 1:
			var coin = randi_range(0, 100)
			# Asshole mode
			if coin >= 85:
				print("asshole mode")
				var minimum = Global.battleGroup[0]
				if minimum.isDead:
					for j in range(1, 4):
						if !Global.battleGroup[j].isDead:
							minimum = Global.battleGroup[j]
							break
				for j in range(4):
					if minimum.cur_hp > Global.battleGroup[j].cur_hp and !Global.battleGroup[j].isDead:
						minimum = Global.battleGroup[j]
				movesArray[i].enemyTarget = minimum
				if minimum.defense > minimum.magic_defense:
					print("targeting weaker magic defense")
					movesArray[i].enemySource.enemyData.useMagic = true
				elif minimum.defense < minimum.magic_defense:
					print("targeting weaker physical defense")
					movesArray[i].enemySource.enemyData.useMagic = false
			# rando mode
			elif coin <= 84:
				print("rando mode")
				movesArray[i].enemyTarget = Global.battleGroup[randi_range(0, 3)]
				while movesArray[i].enemyTarget.isDead:
					print("found dead boi")
					movesArray[i].enemyTarget = Global.battleGroup[randi_range(0, 3)]
				var coin2 = randi_range(0, 100)
				if coin2 >= 50:
					movesArray[i].enemySource.enemyData.useMagic = true
				else:
					movesArray[i].enemySource.enemyData.useMagic = false

func _on_player_0_pressed():
	if typeOfMove == 2 and Global.friendlyOrNot == 1 and Global.clickedSkill != null:
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
		Global.clickedItem.inUse = true
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	
	typeOfMove = -1

func _on_player_1_pressed():
	if typeOfMove == 2 and Global.friendlyOrNot == 1 and Global.clickedSkill != null:
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
		Global.clickedItem.inUse = true
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	
	typeOfMove = -1

func _on_player_2_pressed():
	if typeOfMove == 2 and Global.friendlyOrNot == 1 and Global.clickedSkill != null:
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
		Global.clickedItem.inUse = true
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	typeOfMove = -1

func _on_player_3_pressed():
	if typeOfMove == 2 and Global.friendlyOrNot == 1 and Global.clickedSkill != null:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[3]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].skill = Global.clickedSkill
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
	if typeOfMove == 3 and Global.friendlyOrNot == 1:
		selectedEnemies[currentPlayerCounter].friendlyTarget = Global.battleGroup[3]
		selectedEnemies[currentPlayerCounter].move = typeOfMove
		selectedEnemies[currentPlayerCounter].itemInUse = Global.clickedItem
		Global.clickedItem.inUse = true
		updatePlayerCounter()
		hideTextBox()
		showButtons()
		trackBattle()
		
	typeOfMove = -1

func resetMoves():
	for i in range(7):
		if movesArray[i].isEnemy == 0:
			movesArray[i].target = null
			movesArray[i].friendlyTarget = null
			movesArray[i].skill = null
			if movesArray[i].itemInUse != null:
				movesArray[i].itemInUse.inUse = false
			movesArray[i].itemInUse = null
			movesArray[i].move = 0

func _on_back_button_pressed():
	# Decrement if needed
	if currentPlayerCounter <= 0:
		currentPlayerCounter = 0
	if currentPlayerCounter >= 1:
		currentPlayerCounter -= 1
	$"Item List Panel".hide()
	$"Skill List Panel".hide()
	showButtons()
	# Reset all the choices
	selectedEnemies[currentPlayerCounter].target = null
	selectedEnemies[currentPlayerCounter].friendlyTarget = null
	selectedEnemies[currentPlayerCounter].skill = null
	if selectedEnemies[currentPlayerCounter].itemInUse != null:
		selectedEnemies[currentPlayerCounter].itemInUse.inUse = false
	selectedEnemies[currentPlayerCounter].itemInUse = null
	selectedEnemies[currentPlayerCounter].move = 0
	typeOfMove = 0
	
	trackBattle()


func _on_skill_back_pressed():
	$"Skill List Panel".hide()
	showButtons()
	trackBattle()

func _on_item_back_pressed():
	$"Item List Panel".hide()
	showButtons()
	trackBattle()
