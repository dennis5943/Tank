extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for node in get_children():
		node.hide()
	pass

func _process(delta):
	global_rotation = 0
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass	

func _on_health_changed(value):
	if value <= 100:
		$HealthBar.show()
	$HealthBar.value = value
