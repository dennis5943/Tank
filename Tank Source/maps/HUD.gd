extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var red_bar = preload("res://arts/UI/barHorizontal_red_mid 200.png")
var yellow_bar = preload("res://arts/UI/barHorizontal_yellow_mid 200.png")
var green_bar = preload("res://arts/UI/barHorizontal_green_mid 200.png")
var texture_bar

func _on_Player_health_changed(value):
	texture_bar = green_bar
	if value < 60:
		texture_bar = yellow_bar
	if value < 25:
		texture_bar = red_bar
	
	$MarginContainer/HBoxContainer/HealthBar.texture_progress = texture_bar
	$MarginContainer/HBoxContainer/HealthBar/Tween.interpolate_property(
		$MarginContainer/HBoxContainer/HealthBar,
		'value',
		$MarginContainer/HBoxContainer/HealthBar.value,
		value,
		0.2 ,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$MarginContainer/HBoxContainer/HealthBar/Tween.start()
	$AnimationPlayer.play("health_flash")
	#$MarginContainer/HBoxContainer/HealthBar.value = value


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "health_flash":
		$MarginContainer/HBoxContainer/HealthBar.texture_progress = texture_bar
