extends Area2D

export(String, FILE,"*.tscn") var scene = ""

func _ready():
	pass

func _on_Final_body_entered(body):
	if get_tree().change_scene(scene) !=OK:
		print("Erro!")
	else:
		get_tree().change_scene(scene)
