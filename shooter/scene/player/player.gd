extends CharacterBody2D

func _process(_delta):
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary_action"):
		print("shooting")
	if Input.is_action_just_pressed("secondary_action"):
		print("granede")
