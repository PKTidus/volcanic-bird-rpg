extends Control

# 4 party members max
var player1
var player2
var player3
var player4

var selectedEnemies = [0, 0, 0, 0]

# 3 enemies max
var enemy1
var enemy2
var enemy3

var currentPlayerCounter # range from 1-4
var currentEnemyCounter # range from 1-3

# Called when the node enters the scene tree for the first time.
func _ready():
	hideEnemyButtons()
	getPlayerInfo()
	getEnemyInfo()
	
	currentPlayerCounter = 1
	currentEnemyCounter = 1
	
	trackBattle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func getPlayerInfo():
	player1 = $"Party Panel/Party Container/Player1"
	player2 = $"Party Panel/Party Container/Player2"
	player3 = $"Party Panel/Party Container/Player3"
	player4 = $"Party Panel/Party Container/Player4"

func getEnemyInfo():
	enemy1 = $"Enemies Container/Enemy1"
	enemy2 = $"Enemies Container/Enemy2"
	enemy3 = $"Enemies Container/Enemy3"

func trackBattle():
	if currentPlayerCounter == 1:
		print("Player 1's Turn")
	elif currentPlayerCounter == 2:
		print("Player 2's Turn")
	elif currentPlayerCounter == 3:
		print("Player 3's Turn")
	elif currentPlayerCounter == 4:
		print("Player 4's Turn")

func _on_attack_pressed():
	print("Attack Button Pressed")
	showTextBox("Which enemy?")
	showEnemyButtons()

func _on_skill_pressed():
	print("Skill Button Pressed")
	
	showTextBox("TODO")

func _on_defend_pressed():
	print("Defend Button Pressed")
	
	showTextBox("TODO")

func _on_item_pressed():
	print("Item Button Pressed")
	
	showTextBox("TODO")

func _on_run_pressed():
	print("Run Button Pressed")
	
	showTextBox("You and your party ran away.")
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
	$"Enemies Container/Enemy1/Button".hide()
	$"Enemies Container/Enemy2/Button".hide()
	$"Enemies Container/Enemy3/Button".hide()

func showEnemyButtons():
	$"Enemies Container/Enemy1/Button".show()
	$"Enemies Container/Enemy2/Button".show()
	$"Enemies Container/Enemy3/Button".show()

func _on_enemy1_pressed():
	attackEnemy(enemy1)
	selectedEnemies[currentPlayerCounter] = 1
	updatePlayerCounter()
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()

func _on_enemy2_pressed():
	attackEnemy(enemy2)
	selectedEnemies[currentPlayerCounter] = 2
	updatePlayerCounter()
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()

func _on_enemy3_pressed():
	attackEnemy(enemy3)
	selectedEnemies[currentPlayerCounter] = 3
	updatePlayerCounter()
	
	hideEnemyButtons()
	hideTextBox()
	showButtons()

func attackEnemy(enemy):
	print(enemy.enemy_name + " clicked fr")
	enemy.current_hp -= 5
	enemy.updateHealth()

func updatePlayerCounter():
	currentPlayerCounter += 1
	
	if currentPlayerCounter >= 4:
		currentPlayerCounter = 1
