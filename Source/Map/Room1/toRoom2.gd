extends Area2D

export(String, FILE,"*.tscn") var target_scene1

func _ready():
	pass

var purple_Dead 

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		if get_overlapping_bodies().size()>1:
			next_level()

func clear_level_2():
	purple_Dead = true

func next_level():
		get_tree().change_scene("res://Map/Room2/Room2.tscn")
		Global.door_name = name


	
