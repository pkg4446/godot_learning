extends CharacterBody2D

var can_laser: bool   = true
var can_grenade: bool = true

func _process(_delta):
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary_action") and can_laser:
		print("shooting")
		can_laser = false
		$Timer.start()
	if Input.is_action_just_pressed("secondary_action") and can_grenade:
		print("granede")
		can_grenade = false
		$GranadeReloadTimer.start()

func _on_timer_timeout():
	can_laser = true


func _on_granade_reload_timer_timeout():
	can_grenade = true
