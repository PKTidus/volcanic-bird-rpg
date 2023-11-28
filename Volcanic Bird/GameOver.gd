extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")


func _on_video_stream_player_finished():
	$VideoStreamPlayer.play()
	$Button.show()
