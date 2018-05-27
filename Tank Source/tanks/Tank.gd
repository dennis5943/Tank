extends KinematicBody2D

signal health_changed
signal dead
signal shoot

export (PackedScene) var Bullet
export (int) var max_speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var max_health

var velocity = Vector2()
var can_shoot = true
var alive = true
var health = 0

func _ready():
	$GunTimer.wait_time = gun_cooldown
	health = max_health
	emit_signal('health_changed',health * 100 / max_health)
	
func control(delta):
	pass

func shoot():

	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		$Turret/Muzzle/BloomSprite.show()
		$Turret/Muzzle/BloomSprite.frame = 0
		$Turret/Muzzle/BloomSprite.play("fire")
		var dir = Vector2(1,0).rotated($Turret.global_rotation).rotated(PI / 2)
		emit_signal('shoot',Bullet,$Turret/Muzzle.global_position,dir)

func _on_BloomSprite_animation_finished():
	$Turret/Muzzle/BloomSprite.hide()

func _on_GunTimer_timeout():
	print('_on_GunTimer_timeout')
	can_shoot = true
	
func _physics_process(delta):
	if not alive:
		return
	
	control(delta)
	move_and_slide(velocity)
	
func take_damage(amount):
	print('take_damge',amount)
	health -= amount
	emit_signal('health_changed',health * 100 / max_health)
	if health <= 0:
		explode()
		
func explode():
	$Explosion.show()
	$Explosion.play("fire")
	
func _on_Explosion_animation_finished():
	queue_free()
	pass # replace with function body
