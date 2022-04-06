extends Node

var battle_music = load("res://UI/Audio/Boss theme 1.wav")
var basic_music = load("res://UI/Audio/Overworld theme 1.wav")
var final_music = load("res://UI/Audio/win.wav")
var first_music = load("res://UI/Audio/Start Screen Music.wav")
func _ready():
	pass
	
func play_battle_music():
	$Music.stream = battle_music
	$Music.play()


func play_basic_music():
	$Music.stream = basic_music
	$Music.play()
	$Music.volume_db = -5

func play_final_music():
	$Music.stream = final_music
	$Music.play()

func play_first_music():
	$Music.stream = first_music
	$Music.play()
	
func stop_music():
	$Music.stream = null
