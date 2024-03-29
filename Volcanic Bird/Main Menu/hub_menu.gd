extends Control

var saveFilePath = "user://PlayerSave.tres"

var playerData = PlayerSave.new()

func flipACoin():
	var rng = RandomNumberGenerator.new()
	var res = rng.randi() % 2;
	if res == 0:
		return true
	return false

func _ready():
	Global.whichEnding = 0
	$"MainMenuContainer/Next Event".hide()
	if Global.eventCompleted:
		Global.eventCounter += 1
		Global.eventCompleted = false
		Global.totalEventsCompleted += 1
	if Global.eventCounter >= Global.eventThreshold[Global.floorCounter]:
		$"MainMenuContainer/Next Event".show()
	$EventCounterNumber.text = str(Global.eventCounter)
	$EventThresholdNumber.text = str(Global.eventThreshold[Global.floorCounter])

func _on_play_pressed():
	# Check if party is dead
	var deadPartyMembers = 0
	
	for i in range(4):
		if Global.battleGroup[i].isDead:
			deadPartyMembers += 1
	
	if deadPartyMembers == 4:
		return
	
	get_tree().change_scene_to_file("res://Events/EventChoice.tscn")


func _on_creatures_pressed():
	get_tree().change_scene_to_file("res://CreatureMenu/CreatureMenu.tscn")


func _on_storage_box_pressed():
	get_tree().change_scene_to_file("res://ItemManagement/ItemManagement.tscn")


func _on_save__quit_pressed():
	save()
	
func save():
	playerData.battleGroup = Global.battleGroup
	playerData.creatureStorage = Global.creatureStorage
	playerData.itemInventory = Global.itemInventory
	playerData.itemStorage = Global.itemStorage
	playerData.eventCounter = Global.eventCounter
	playerData.floorCounter = Global.floorCounter
	playerData.totalEventsCompleted = Global.totalEventsCompleted
	ResourceSaver.save(playerData, saveFilePath)
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")


func _on_next_event_pressed():
	if Global.floorCounter == 1:
		get_tree().change_scene_to_file("res://Main Menu/BossSceneFinalReal.tscn")
	else:
		$"MainMenuContainer/Next Event".hide()
		Global.floorCounter += 1
		Global.eventCounter = 0
		$EventCounterNumber.text = str(Global.eventCounter)
		$EventThresholdNumber.text = str(Global.eventThreshold[Global.floorCounter])


func _on_creatures_2_pressed():
	get_tree().change_scene_to_file("res://Main Menu/manual.tscn")
