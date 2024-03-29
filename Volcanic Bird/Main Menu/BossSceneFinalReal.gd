extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_option_b_pressed():
	var myArray = [null, null, null]
	myArray[0] = "res://Enemies/VolcanicCloneEnemy.tres"
	myArray[1] = "res://Enemies/VolcanicBirdEnemy.tres"
	myArray[2] = "res://Enemies/VolcanicCloneEnemy.tres"
	Global.selected_enemy_paths = myArray
	$EventDescription.text = "You fight for a noble cause! Will you be humbled by the root of all evil?"
	Global.background = "res://Resources/Backgrounds/ice.png"
	Global.whichEnding = 2
	
	$"Option A".hide()
	$"Option B".hide()
	$Proceed.show()

func _on_option_a_pressed():
	var myArray = [null, null, null]
	myArray[0] = "res://Enemies/CrowillaEnemy.tres"
	myArray[1] = "res://Enemies/UltraCrowillaEnemy.tres"
	myArray[2] = "res://Enemies/CrowillaEnemy.tres"
	Global.selected_enemy_paths = myArray
	$EventDescription.text = "You decided to join the very thing that is seeking to end the world! A powerful energy approaches... the leader of the crowillas has completed his training and is here to stop you and the Volcanic Bird!"
	Global.background = "res://Resources/Backgrounds/forest.png"
	Global.whichEnding = 1 
	
	$"Option A".hide()
	$"Option B".hide()
	$Proceed.show()
	
func _on_proceed_pressed():
	get_tree().change_scene_to_file("res://battleScene/battle.tscn")
