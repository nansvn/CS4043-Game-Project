extends Area2D

export(String, FILE,"*.tscn") var target_scene

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		if get_overlapping_bodies().size()>1:
			next_level()

func next_level():
	var ERR=get_tree().change_scene("res://Map_Clear/4/Room6/Room6.tscn")
	Global.door_name = name
