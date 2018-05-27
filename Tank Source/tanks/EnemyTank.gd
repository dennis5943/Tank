extends "res://tanks/Tank.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var parent = get_parent()

export (float) var turret_speed
export (int) var detect_radius

var speed = 0
var target = null

func _ready():
	var circle = CircleShape2D.new()
	$DetectRadius/Collision.shape = circle
	$DetectRadius/Collision.shape.radius = detect_radius
	
	pass
	
func control(delta):
	
	if $LookAheadR.is_colliding() or $LookAheadL.is_colliding():
		speed = lerp(speed,0,0.1)
	else:
		speed = lerp(speed,max_speed,0.1)
	
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
	else:
		pass

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1,0).rotated($Turret.global_rotation)
		target_dir = target_dir.rotated(- PI / 2)
		
		$Turret.global_rotation = current_dir.linear_interpolate(target_dir,turret_speed * delta).angle()
		
		if target_dir.dot(current_dir) > 0.9:
			shoot()

func _on_DetectRadius_body_entered(body):
	print('enter:',body.name)
	if body.name == 'Player':
		target = body


func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null
		
