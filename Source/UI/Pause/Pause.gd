extends CanvasLayer

var pause_state = true

func _ready():
	pass 

func _pause_check():
		if pause_state:
			get_tree().paused=true
			pause_state = false
			$PauseC.visible = true

func _on_Continue_pressed():
	get_tree().paused = false
	pause_state = true
	$PauseC.visible = false

func _on_Exit_pressed():
	get_tree().quit()
