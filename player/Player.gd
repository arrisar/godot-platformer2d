class_name Player
extends CharacterBody2D

@onready var sprites: AnimatedSprite2D = $Sprites

const ATTACK_LENGTH: int = 500
const AIR_ATTACK_MAX: int = 1
var AIR_ATTACK_COUNT: int = 0

const ACCELERATION: int = 2000
const RUN_SPEED: int = 128

const JUMP_HEIGHT: int = 64
const JUMP_TIME: float = 1000
const JUMP_TIME_TO_PEAK: float = JUMP_TIME / 2000
@onready var GRAVITY: float = (2 * JUMP_HEIGHT) / pow(JUMP_TIME_TO_PEAK, 2)
@onready var JUMP_SPEED: float = GRAVITY * JUMP_TIME_TO_PEAK


# apply horizontal velocity
func move_horizontal(delta: float) -> float:
	var direction = Input.get_axis('move_right', 'move_left')
	velocity.x = move_toward(velocity.x, direction * RUN_SPEED, ACCELERATION * delta)
	return direction
