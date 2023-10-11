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
var selectedEnemies = [0, 0, 0, 0]

# 3 enemies max
var enemy1
var enemy2
var enemy3

var currentPlayerCounter # range from 1-4
var currentEnemyCounter # range from 1-3

func _ready():
	setupSampleGroup()
	hideEnemyButtons()
	getPlayerInfo()
	getEnemyInfo()
	loadCreatures()
	
	currentPlayerCounter = 0
	currentEnemyCounter = 0
	
	trackBattle()

# Simply for loading in sample creatures, not needed for final build
func setupSampleGroup():
	Global.battleGroup[0] = load("res://Creatures/Purple_Flower.tres")
	Global.battleGroup[1] = load("res://Creatures/Wizard.tres")
	Global.battleGroup[2] = load("res://Creatures/Shroom.tres")
	Global.battleGroup[3] = load("res://Creatures/Wizard.tres")
	
# To load in the creatures into the buttons and their health and mp
func loadCreatures():
	var currentIndex = 0
	for node in $"Party Panel/Party Container".get_children():
		node.creatureData = Global.battleGroup[currentIndex]
		currentIndex += 1 
		node.emit_signal("updateButtons")
		if currentIndex == 4:
			break

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
	if currentPlayerCounter == 0:
		print("Player 0's Turn")
	elif currentPlayerCounter == 1:
		print("Player 1's Turn")
	elif currentPlayerCounter == 2:
		print("Player 2's Turn")
	elif currentPlayerCounter == 3:
		print("Player 3's Turn")

func _on_attack_pressed():
	print("Attack Button Pressed")
	showTextBox("Which enemy?")
	showEnemyButtons()

func _on_skill_pressed():
	var skills = SkillList.new()
	skills.initializeSkills()
	print(skills.getSkillList())
	skills.printSkillList()
	
	showTextBox("Which Skill?")

func _on_defend_pressed():
	print("Defend Button Pressed")
	
	showTextBox("TODO")

func _on_item_pressed():
	print("Item Button Pressed")
	
	showTextBox("TODO")

func _on_run_pressed():
	var rng = RandomNumberGenerator.new()
	var randomNumber = rng.randi_range(1, 100)
	
	# Low Chance: Party escapes unharmed
	if randomNumber >= 1 && randomNumber <= 20:
		showTextBox("You and your party ran away.")
	
	# High Chance: Party escapes with hp damage
	elif randomNumber >= 21 && randomNumber <= 100:
		showTextBox("Your party loses 5 HP!\nYou and your party ran away.")
		player0.decreaseHealth(5)
		player1.decreaseHealth(5)
		player2.decreaseHealth(5)
		player3.decreaseHealth(5)
	
	await get_tree().create_timer(3).timeout # pause the game for 3 seconds
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn") # go to the hub menu scene


func hideTextBox():
	showButtons()
	$"Actions Panel/Actions Container/Textbox".text = ""

func showTextBox(text):
	hideButtons()
	$"Actions Panel/Actions Container/Textbox".text = text

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
	attackEnemy(enemy1)
	selectedEnemies[currentPlayerCounter] = 1
	updatePlayerCounter()
	
	print(selectedEnemies)
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()
	
	trackBattle()

func _on_enemy2_pressed():
	attackEnemy(enemy2)
	selectedEnemies[currentPlayerCounter] = 2
	updatePlayerCounter()
	
	print(selectedEnemies)
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()
	
	trackBattle()

func _on_enemy3_pressed():
	attackEnemy(enemy3)
	selectedEnemies[currentPlayerCounter] = 3
	updatePlayerCounter()
	
	print(selectedEnemies)
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()
	
	trackBattle()

func attackEnemy(enemy):
	print(enemy.enemy_name + " clicked fr")
	enemy.current_hp -= 5
	enemy.updateHealth()

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
		currentPlayerCounter = 0
