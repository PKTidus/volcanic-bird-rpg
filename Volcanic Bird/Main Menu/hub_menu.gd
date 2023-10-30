extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://battleScene/battle.tscn")


func _on_creatures_pressed():
	get_tree().change_scene_to_file("res://CreatureMenu/CreatureMenu.tscn")


func _on_storage_box_pressed():
	get_tree().change_scene_to_file("res://ItemManagement/ItemManagement.tscn")
