extends Node2D

export (int)var length
export (int)var width
export (int)var degrees

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	global_rotation_degrees = degrees

func _draw():
	var destV = Vector2(length,0)
	var upV =  destV + Vector2(0,lerp(0,-length,0.2)).rotated(-PI/3)
	var downV =  destV + Vector2(0,lerp(0,length,0.2)).rotated(PI/3)
	draw_line( Vector2(), destV, Color(1,0,0), width, true)
	draw_line( destV,upV, Color(1,0,0), width, true)
	draw_line( destV,downV, Color(1,0,0), width, true)
	#draw_line( Vector2(150,-40), destV, Color(1,0,0), width, true)
