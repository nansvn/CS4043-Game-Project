extends Node2D


func _ready():
	MusicControl.play_final_music()

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://UI/Menu/Menu.tscn")
		MusicControl.stop_music()
