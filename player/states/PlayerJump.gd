extends PlayerState

var start_time: float


func enter(_data := {}) -> void:
	start_time = Time.get_ticks_msec()
	player.sprites.play('Jump')
	player.velocity.y = -player.JUMP_SPEED
	player.move_and_slide()


func physics_update(_delta: float) -> void:
	if (Time.get_ticks_msec() - start_time) > player.JUMP_TIME:
		machine.transition('Fall')
	
	if player.is_on_floor():
		machine.transition('Idle')

	player.velocity.y += player.GRAVITY * _delta
	player.move_horizontal(_delta)
	player.move_and_slide()
