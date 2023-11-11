extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Button handlers
func _on_option_a_pressed():
	goToBattle()

func _on_option_b_pressed():
	goToBattle()

func _on_option_c_pressed():
	goToBattle()

# Functions
func goToBattle():
	get_tree().change_scene_to_file("res://battleScene/battle.tscn")
