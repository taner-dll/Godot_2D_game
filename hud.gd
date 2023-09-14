extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

func update_score(score):
	$ScoreLabel.text = str(score)
	
	
func _on_message_timer_timeout():
	$Message.hide()
	
	


func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()


