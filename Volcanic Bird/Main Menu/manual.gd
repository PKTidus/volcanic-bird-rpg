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
	$Description.text = "Page 1"
	$PageNum.text = "1"

func loadPageTwo():
	page = 2
	showInPageButtons()
	$Description.text = "Page 2"
	$PageNum.text = "2"

func loadPageThree():
	page = 3
	showInPageButtons()
	$Description.text = "Page 3"
	$PageNum.text = "3"

func loadPageFour():
	page = 4
	showInPageButtons()
	$Description.text = "Page 4"
	$PageNum.text = "4"

func loadPageFive():
	page = 5
	showInPageButtons()
	$Description.text = "Page 5"
	$PageNum.text = "5"

func loadPageSix():
	page = 6
	showInPageButtons()
	$Description.text = "Page 6"
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
