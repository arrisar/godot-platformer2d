extends PlayerState


func enter(_data := {}) -> void:
	player.sprites.play('Idle')
	player.velocity.x = 0
	player.velocity.y = 0


func update(_delta: float) -> void:
	if not player.is_on_floor():
		return machine.transition('Fall')
	
	if Input.is_action_pressed("move_left"):
		return machine.transition('Run')
		
	if Input.is_action_pressed("move_right"):
		return machine.transition('Run')
	
	if Input.is_action_just_pressed("jump"):
		return machine.transition('Jump')
