extends Area2D

export(String, FILE,"*.tscn") var target_scene1

func _ready():
	pass

func _physics_process(delta):
	if  Input.is_action_pressed("ui_down"):
		if get_overlapping_bodies().size()>1:
			next_level()

func next_level():
	var ERR=get_tree().change_scene("res://Map_Clear/4/Room4/Room4.tscn")
	Global.door_name = name
