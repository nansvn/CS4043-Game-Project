extends Area2D

export(String, FILE,"*.tscn") var target_scene1

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		if get_overlapping_bodies().size()>1:
			next_level()

func next_level():
	var ERR=get_tree().change_scene("res://Map/Room6/Room6.tscn")
	Global.door_name = name
