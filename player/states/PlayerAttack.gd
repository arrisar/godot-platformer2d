extends PlayerState

const DASH_SPEED: float = 50
const DASH_TIME: float = 200
const DASH_WAIT: float = 50

var start_time: float
var first_dash_end: float
var second_dash_start: float
var second_dash_end: float


func enter(_data := {}) -> void:
	start_time = Time.get_ticks_msec()
	first_dash_end = start_time + DASH_TIME
	second_dash_start = first_dash_end + DASH_WAIT
	second_dash_end = second_dash_start + DASH_TIME
	
	player.sprites.play('Attack')
	player.velocity.x = DASH_SPEED * player.scale.y
	player.velocity.y = 0
	player.move_and_slide()


func physics_update(_delta: float) -> void:
	var now = Time.get_ticks_msec()
	
	if (now - start_time) > player.ATTACK_LENGTH:
		machine.transition('Idle')
		
	if now > second_dash_end:
		player.velocity.x = 0
	elif now > second_dash_start:
		player.velocity.x = DASH_SPEED * player.scale.y
	elif now > first_dash_end:
		player.velocity.x = 0
	
	player.move_and_slide()
	
