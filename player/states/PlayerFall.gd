extends PlayerState


func enter(_data := {}) -> void:
	player.sprites.play('Fall')


func physics_update(_delta: float) -> void:
	if player.is_on_floor():
		machine.transition('Idle')

	player.velocity.y += player.GRAVITY * _delta
	player.move_horizontal(_delta)
	player.move_and_slide()
