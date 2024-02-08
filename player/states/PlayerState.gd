class_name PlayerState
extends State

@onready var player: Player = owner


func exit() -> void:
	player.sprites.stop()


func handle_input(_event: InputEvent) -> void:
	if Input.is_action_pressed('attack'):
		if not player.is_on_floor() and player.AIR_ATTACK_COUNT < player.AIR_ATTACK_MAX:
			player.AIR_ATTACK_COUNT += 1
			machine.transition('Attack')
		elif player.is_on_floor():
			machine.transition('Attack')


func physics_update(_delta: float) -> void:
	if player.is_on_floor() and player.AIR_ATTACK_COUNT != 0:
		player.AIR_ATTACK_COUNT = 0
