extends Node



onready var Player_health = $"Node/Health Bar/Player_HPBAR"
onready var Enemy_health = $"Node/Health Bar/Enemy_HPBAR"
onready var Item_count = 3
onready var Enemy_Sprite = get_node("Node/Enemy/Sprite")
onready var fight = get_node("Node/Control/Buttons/Fight").connect("pressed", self, "_on_Button_pressed")
onready var magic = get_node("Node/Control/Buttons/Magic").connect("pressed", self, "_on_Button_pressed")
onready var item = get_node("Node/Control/Buttons/Item").connect("pressed", self, "_on_Button_pressed")
onready var run = get_node("Node/Control/Buttons/Run").connect("pressed", self, "_on_Button_pressed")
onready var RunChance_times = 3
onready var label = Label.new()
var t = Timer.new()
onready var Enemy_Turn_NUM = 0
onready var Player_Turn_NUM = 0
onready var timer = get_node("Timer")
var base_model = preload("res://Monsters/M2 normal.png")
var DMG_model= preload("res://Monsters/M2 damage.png")

func _on_Fight_pressed():
	var fight_label = "empty"
	if Enemy_health.value <= 0 or Player_health.value <=0 or Player_Turn_NUM > Enemy_Turn_NUM:
		get_tree().paused = true
	else:
		var HitOrMiss = randi()%51
		var fight_damage = 15
		if HitOrMiss >= 10:
			Enemy_health.value -= fight_damage
			fight_label = ("Your attack dealt " + str(fight_damage) + " damage!")
		else:
			fight_label = ("Your attack missed!")
		Player_Turn_NUM +=1
		$Node/Label.text = str(fight_label)
		OS.delay_msec (150)

func _ready():
	MusicControl.play_battle_music()
	
	
func _on_Magic_pressed():
	var magic_label = "empty"
	if Enemy_health.value <= 0 or Player_health.value <=0 or Player_Turn_NUM > Enemy_Turn_NUM:
		get_tree().paused = true
	else:
		var HitOrMiss = (randi()%51)
		var magic_damage = 25
		if HitOrMiss >= 20:
			Enemy_health.value -= magic_damage
			magic_label = ("Your magic dealt " + str(magic_damage) + " damage!") 
		else:
			magic_label = ("You missed!")
		Player_Turn_NUM += 1
		$Node/Label.text = str(magic_label)
		OS.delay_msec (150)

func _on_Item_pressed():
	var item_label = "empty"
	if Enemy_health.value <= 0 or Player_health.value <=0 or Player_Turn_NUM > Enemy_Turn_NUM:
		get_tree().paused = true
	else:
		if Item_count >= 0:
			if Player_health.value >= 100 :
				item_label = ("You're already max HP!")
				pass
			elif Player_health.value >= 90 :
				var Health_gain = (100 - Player_health.value)
				Player_health.value = 100
				Item_count -=1
				item_label = ("You gained "  + str(Health_gain) + " HP!")
			elif Player_health.value <=89 and Player_health.value >=1:
				Player_health.value += 30
				Item_count -=1
				item_label = ("You gained 30 HP")
			Player_Turn_NUM +=1
		else:
			item_label =("You have no more potions!")
		$Node/Label.text = str(item_label)
		OS.delay_msec (150)


func _on_Run_pressed():
	var run_label = "empty" 
	if Enemy_health.value <= 0 or Player_health.value <=0 or Player_Turn_NUM > Enemy_Turn_NUM:
		get_tree().paused = true
	else:
		var RunChance = randi()%51
		if RunChance_times != 0:
			if RunChance > 30:
				run_label = ("You escaped!")
				MusicControl.play_basic_music()
				get_tree().change_scene("res://Map/Room4/Room4.tscn")
			else:
				RunChance_times -= 1
				run_label = ("You couldnt escape!" + " You have " + str(RunChance_times) + " more tries to escape!")
			Player_Turn_NUM +=1
		else:
			run_label = ("You can't escape!")
		$Node/Label.text = str(run_label)
		OS.delay_msec (150)

func Enemy_DMG_System():
	var enemy_label = "empty"
	OS.delay_msec (150)
	var Enemy_dmg = randi()%35
	var Enemy_Hit_chance = randi()%51
	if Enemy_Hit_chance >= 25:
		Player_health.value -= Enemy_dmg
		enemy_label = ("You lost " + str(Enemy_dmg) + " health!")
	else:
		enemy_label = ("The enemy missed!")
	$Node/Label2.text = str(enemy_label)
	Enemy_Turn_NUM +=1
	


func _process(delta):
	if Enemy_health.value <= 20:
		Enemy_Sprite.set_texture(DMG_model)
	if Player_health.value <=0:
		MusicControl.play_basic_music()
		get_tree().change_scene("res://Map/Room4/Room4.tscn")
		print("You lost")
	if Enemy_health.value <= 0:
		MusicControl.play_basic_music()
		get_tree().change_scene("res://Map_Clear/3/Room4/Room4.tscn")
	if Player_Turn_NUM >= Enemy_Turn_NUM and Player_Turn_NUM != 0:
		Enemy_DMG_System()
