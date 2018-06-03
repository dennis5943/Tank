extends Node2D

export (String) var lbText

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for node in get_children():
		node.hide()
	pass

func _process(delta):
	global_rotation = 0
	$HealthBar/Label.text = lbText
	pass

func _on_health_changed(value):
	if value <= 100:
		$HealthBar.show()
	$HealthBar.value = value
