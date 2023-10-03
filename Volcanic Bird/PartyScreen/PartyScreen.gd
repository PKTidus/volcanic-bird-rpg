extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	instanceBattleGroup()
	
func instanceBattleGroup():
	if Global.battleGroup[0] is Object:
		$VBoxContainer/BattleGroupButtonParty.creatureData = Global.battleGroup[0]
	elif Global.battleGroup[0] is String:
		$VBoxContainer/BattleGroupButtonParty.creatureData = load(Global.battleGroup[0])
	if Global.battleGroup[1] is Object:
		$VBoxContainer/BattleGroupButtonParty2.creatureData = Global.battleGroup[1]
	elif Global.battleGroup[1] is String:
		$VBoxContainer/BattleGroupButtonParty2.creatureData = load(Global.battleGroup[1])
	if Global.battleGroup[2] is Object:
		$VBoxContainer/BattleGroupButtonParty3.creatureData = Global.battleGroup[2]
	elif Global.battleGroup[2] is String:
		$VBoxContainer/BattleGroupButtonParty3.creatureData = load(Global.battleGroup[2])
	if Global.battleGroup[3] is Object:
		$VBoxContainer/BattleGroupButtonParty4.creatureData = Global.battleGroup[3]
	elif Global.battleGroup[3] is String:
		$VBoxContainer/BattleGroupButtonParty4.creatureData = load(Global.battleGroup[3])
	
	$VBoxContainer/BattleGroupButtonParty.connect("battleButtonFocus", onBattleGroupFocus)
	$VBoxContainer/BattleGroupButtonParty2.connect("battleButtonFocus", onBattleGroupFocus)
	$VBoxContainer/BattleGroupButtonParty3.connect("battleButtonFocus", onBattleGroupFocus)
	$VBoxContainer/BattleGroupButtonParty4.connect("battleButtonFocus", onBattleGroupFocus)
	
func onBattleGroupFocus():
	print("1")
	$Name.text = str(Global.current_name)
	$Description.text = str(Global.current_description)
