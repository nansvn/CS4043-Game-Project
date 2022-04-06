extends TextureProgress


onready var Enemy_health   = 100
onready var Enemy_health_bar = get_node(".")

func _ready():
	
	Enemy_health_bar.max_value = Enemy_health
	Enemy_health_bar.value = Enemy_health
	
