extends Control

# 4 party members max
var player1
var player2
var player3
var player4

# 3 enemies max
var enemy1
var enemy2
var enemy3

# Called when the node enters the scene tree for the first time.
func _ready():
	getPlayerInfo()
	getEnemyInfo()

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

func _on_attack_pressed():
	print("Attack Button Pressed")
	
	hideButtons()
	$"Actions Panel/Actions Container/Textbox".text = "TODO"

func _on_skill_pressed():
	print("Skill Button Pressed")
	
	hideButtons()
	$"Actions Panel/Actions Container/Textbox".text = "TODO"

func _on_defend_pressed():
	print("Defend Button Pressed")
	
	hideButtons()
	$"Actions Panel/Actions Container/Textbox".text = "TODO"

func _on_item_pressed():
	print("Item Button Pressed")
	
	hideButtons()
	$"Actions Panel/Actions Container/Textbox".text = "TODO"

func _on_run_pressed():
	print("Run Button Pressed")
	
	hideButtons()
	$"Actions Panel/Actions Container/Textbox".text = "You and your party ran away."
	await get_tree().create_timer(3).timeout # pause the game for 3 seconds
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn") # go to the hub menu scene

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
