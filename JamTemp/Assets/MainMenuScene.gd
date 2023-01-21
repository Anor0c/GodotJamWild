extends CanvasLayer

signal start_game

func show_message(text):
	$Label.text=text
	$Label.show()


func _on_Button_pressed():
	$StartButton.hide()
	emit_signal("start_game")
