extends CharacterBody2D

signal  laser(pos, direction)
signal  granede(pos, direction)

var can_laser: bool   = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())
	
	# laser shooting input
	if Input.is_action_pressed("primary_action") and can_laser:
		$GPUParticles2D.emitting = true
		can_laser = false
		$LaserTimer.start()
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser = laser_markers[randi()%laser_markers.size()].global_position
		var player_direction = (get_global_mouse_position() - position).normalized()
		laser.emit(selected_laser, player_direction)
		
	if Input.is_action_just_pressed("secondary_action") and can_grenade:
		can_grenade = false
		$GranadeReloadTimer.start()
		var pos = $LaserStartPosition.get_children()[0].global_position
		var player_direction = (get_global_mouse_position() - position).normalized()
		granede.emit(pos, player_direction)

func _on_timer_timeout():
	can_laser = true
	
func _on_granade_reload_timer_timeout():
	can_grenade = true
