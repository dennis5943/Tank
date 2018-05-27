extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_camera_limits()
	Input.set_custom_mouse_cursor(load("res://arts/UI/crossair_black.png"))
	
func set_camera_limits():
	var map_limits = $Ground.get_used_rect()
	var map_cell_size = $Ground.cell_size 
	
	print("map_limits",map_limits)
	print("map_cell_size",map_cell_size)
	
	$Player/Camera2D.limit_left =  map_limits.position.x * map_cell_size.x
	$Player/Camera2D.limit_right =  map_limits.end.x * map_cell_size.x
	$Player/Camera2D.limit_top =  map_limits.position.y * map_cell_size.y
	$Player/Camera2D.limit_bottom =  map_limits.end.y * map_cell_size.y

func _on_Tank_shoot(bullet,_position,_direction):
	print('_on_Tank_shoot')
	var b = bullet.instance()
	
	add_child(b)
	b.start(_position,_direction)

