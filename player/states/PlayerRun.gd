extends PlayerState


func enter(_data := {}) -> void:
	player.sprites.play('Run')


func update(_delta: float) -> void:
	if not player.is_on_floor():
		return machine.transition('Fall')

	if Input.is_action_just_pressed("jump"):
		return machine.transition('Jump')
		
	var isLeftPressed = Input.is_action_pressed("move_left")
	var isRightPressed = Input.is_action_pressed("move_right")
	var isDirectionPressed = isLeftPressed || isRightPressed
	
	if not isDirectionPressed:
		return machine.transition('Idle')
	
	var direction = player.move_horizontal(_delta)
	
	if direction == 0:
		player.sprites.play('Idle')
		return

	player.scale.x = player.scale.y * direction
	player.sprites.play('Run')
	player.move_and_slide()
