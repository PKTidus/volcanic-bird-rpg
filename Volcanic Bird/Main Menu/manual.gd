extends ColorRect


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

func showPageButtons():
	$Page1.show()
	$Page2.show()
	$Page3.show()
	$Page4.show()
	$Page5.show()
	$Page6.show()

func _on_go_left_pressed():
	pass # Replace with function body.


func _on_go_right_pressed():
	pass # Replace with function body.
