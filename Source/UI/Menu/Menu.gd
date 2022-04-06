extends MarginContainer
onready var selector_one = $Sprite/CenterContainer/VBoxContainer/Button/VBoxContainer/Start/HBoxContainer/Selector
onready var selector_two = $Sprite/CenterContainer/VBoxContainer/Button/VBoxContainer/Credit/HBoxContainer/Selector
onready var selector_three = $Sprite/CenterContainer/VBoxContainer/Button/VBoxContainer/Exit/HBoxContainer/Selector
var current_selection = 0

func _ready():
	set_current_selection(0)
	MusicControl.play_first_music()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

		
func set_current_selection(_current_selection):
	selector_one.text=""
	selector_two.text=""
	selector_three.text=""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"



func handle_selection(_current_selection):
	if current_selection ==0:
		get_tree().change_scene("res://Map/Room1/Room1.tscn")
		MusicControl.stop_music()
		queue_free()
	elif current_selection ==1:
		get_tree().change_scene("res://UI/Menu/Credit.tscn")
		MusicControl.stop_music()
		queue_free()
	elif current_selection ==2:
		get_tree().quit()
		
