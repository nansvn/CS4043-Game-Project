extends Node2D


func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		Pause._pause_check()

func _on_Continue_pressed():
	get_tree().paused = false
	Pause.pause_state = true
	$PauseC.visible = false

func _on_Exit_pressed():
	get_tree().quit()
