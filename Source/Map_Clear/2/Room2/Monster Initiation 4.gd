extends Area2D

func _process(delta):
	if bool(Input.is_action_pressed("ui_right")):
		if get_overlapping_bodies().size() > 0:
			start_combat()
	elif bool(Input.is_action_pressed("ui_up")):
		if get_overlapping_bodies().size() > 0:
			start_combat()
	elif bool(Input.is_action_pressed("ui_down")):
		if get_overlapping_bodies().size() > 0:
			start_combat()
	elif bool(Input.is_action_pressed("ui_left")):
		if get_overlapping_bodies().size() > 0:
			start_combat()

func start_combat():
	get_tree().change_scene("res://Battles/Battle_Purple.tscn")


