extends TextureProgress


onready var Player_health   = 100
onready var Player_health_bar = get_node(".")

func _ready():
	
	Player_health_bar.max_value = Player_health
	Player_health_bar.value = Player_health
