extends ColorRect

@onready var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hidePageButtons():
	$Page1.hide()
	$Page2.hide()
	$Page3.hide()
	$Page4.hide()
	$Page5.hide()
	$Page6.hide()
	$Return.hide()

func showPageButtons():
	$Page1.show()
	$Page2.show()
	$Page3.show()
	$Page4.show()
	$Page5.show()
	$Page6.show()
	$Return.show()

func hideInPageButtons():
	$GoLeft.hide()
	$GoRight.hide()
	$Description.hide()
	$PageNum.hide()
	$BackButton.hide()

func showInPageButtons():
	$GoLeft.show()
	$GoRight.show()
	$Description.show()
	$PageNum.show()
	$BackButton.show()

func loadPageOne():
	page = 1
	showInPageButtons()
	$Description.text = "So you want to be an adventurer? Get ready to learn all there is to know with yours truly, Lucian Venture, the greatest adventurer to ever live! 
	\nThe basics of adventuring are as follows: 
		when you hit play you'll see a new event! 
		You get three choices! 
		They rarely have a single possible outcome!\n
		Try everything and find the most efficient way to reach the boss!\n
		When reaching the threshold for events, you can move onto the next floor with a new threshold."
	$PageNum.text = "1"

func loadPageTwo():
	page = 2
	showInPageButtons()
	$Description.text = "A great adventurer knows how to fight! We don't do any fighting ourselves however... that's what our trusty creatures are for!\n
	In battles you get five options each turn:\n
	Attack: this is your most basic method of dealing damage and uses your creature's attack stat to calculate how much you do.\n
	Skill: this is your most vital asset to dealing massive damage or gaining a tactical advantage! Magical characters prefer to hit with spells, which strike at the enemies' magic defense! Buffs, debuffs and healing are great too!\n
	Defend: this will lower the damage your creature takes on that turn!
	Item: this will allow you to use your various items you've accumulated!\n
	Run: if you don't think you can win, you can always run away!"
	$PageNum.text = "2"

func loadPageThree():
	page = 3
	showInPageButtons()
	$Description.text = "Ah, your majestic creatures! Use them well to aid you on your quest!
	Their attack damage and magic attack damage determine how much damage they can deal with physical attacks/skills and magical skills respectively. Check skill descriptions for what stats are used in calculations!\n
	Your creatures' defense stats are used to divide the damage taken from attacks they are receiving, remember: a strong defense is the best offense... or something like that\n
	Your creatures' HP is how much damage they can take before dying... fear not! When a creature dies you can still get them back up with a revival item or leveling up!\n
	Similar things are true for MP, though this is only used to cast skills, you may also exceed the maximum by using items.\n
	Speed will determine turn order, get the jump on your enemies with blazing speed!"
	$PageNum.text = "3"

func loadPageFour():
	page = 4
	showInPageButtons()
	$Description.text = "Enemies are scary and get stronger with the more events you witness!\n
	They have a chance to attack your lowest health creature in attempts to swipe a kill and also have the capability to target your weaker defensive stat!\n
	Outrageous!\n"
	$PageNum.text = "4"

func loadPageFive():
	page = 5
	showInPageButtons()
	$Description.text = "Every adventurer's true calling is to reach the 10 event threshold and move on to floor 2 but this is only the beginning!\n
	After reaching floor 2 you'll see the 15 event threshold... once this is reached the next floor button will take you to the climactic finale of your adventure!\n
	If you can defeat a final boss, you win! If you couldn't make it, give it another shot. Try new creatures, strategies and event choices."
	$PageNum.text = "5"

func loadPageSix():
	page = 6
	showInPageButtons()
	$Description.text = "Some tips from yours truly:\n
	Look for events that level up your party and fight when you can win, the rewards are worth it.\n
	Events that give your party stat boosts are also good.\n
	It may be worthwhile recruiting creatures later in your journey, their base stats will be improved even though their level is 1!\n
	While later battles are more difficult, the experience bounty will be much greater!\n
	Enemies always drop items, make good use of them!\n
	Attacks will do nothing if they targeted an enemy that died mid-turn. Plan carefully!"
	$PageNum.text = "6"

func _on_go_left_pressed():
	page -= 1
	if page <= 0:
		page = 1
	if page == 1:
		loadPageOne()
	if page == 2:
		loadPageTwo()
	if page == 3:
		loadPageThree()
	if page == 4:
		loadPageFour()
	if page == 5:
		loadPageFive()
	if page == 6:
		loadPageSix()


func _on_go_right_pressed():
	page += 1
	if page > 6:
		page = 6
	if page == 1:
		loadPageOne()
	if page == 2:
		loadPageTwo()
	if page == 3:
		loadPageThree()
	if page == 4:
		loadPageFour()
	if page == 5:
		loadPageFive()
	if page == 6:
		loadPageSix()


func _on_page_1_pressed():
	hidePageButtons()
	showInPageButtons()
	loadPageOne()

func _on_page_2_pressed():
	hidePageButtons()
	showInPageButtons()
	loadPageTwo()

func _on_page_3_pressed():
	hidePageButtons()
	showInPageButtons()
	loadPageThree()

func _on_page_4_pressed():
	hidePageButtons()
	showInPageButtons()
	loadPageFour()

func _on_page_5_pressed():
	hidePageButtons()
	showInPageButtons()
	loadPageFive()

func _on_page_6_pressed():
	hidePageButtons()
	showInPageButtons()
	loadPageSix()

func _on_back_button_pressed():
	page = 0
	hideInPageButtons()
	showPageButtons()

func _on_return_pressed():
	get_tree().change_scene_to_file("res://Main Menu/hub_menu.tscn")
