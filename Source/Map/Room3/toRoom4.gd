extends Area2D

export(String, FILE,"*.tscn") var target_scene

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_down"):
		if get_overlapping_bodies().size()>1:
			next_level()

func next_level():
	var ERR=get_tree().change_scene(target_scene)
	Global.door_name = name
