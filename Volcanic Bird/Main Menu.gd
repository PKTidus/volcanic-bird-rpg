extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")


func _on_load_game_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
