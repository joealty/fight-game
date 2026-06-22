extends Node3D

var walkspeed = 2
var verticalvelocity = 0
var gravity = 8
var jumpvelocity = 5


func _physics_process(delta):
	var currentstamina = $Control/stamina.size.x
	if Input.is_key_pressed(KEY_D):
		$body.position.x = $body.position.x + walkspeed*delta	
		
	if $body.position.y == 1:
		if Input.is_key_pressed(KEY_SPACE):
			verticalvelocity = jumpvelocity
	
	if Input.is_key_pressed(KEY_A):
		$body.position.x = $body.position.x + - walkspeed*delta
	
	$body.position.y = $body.position.y + verticalvelocity*delta
	verticalvelocity = verticalvelocity - gravity*delta
	if $body.position.y <= 1:
		$body.position.y = 1
		
	if Input.is_key_pressed(KEY_W):
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("punch")
			$AudioStreamPlayer.play()
			currentstamina = currentstamina -20
			
	currentstamina = currentstamina + 5*delta
	if currentstamina >= 505:
		currentstamina = 505
		
	$Control/stamina.size.x = currentstamina
