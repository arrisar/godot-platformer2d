class_name State
extends Node

@onready var machine: StateMachine = get_parent()

# _unhandled_input()
func handle_input(_event: InputEvent) -> void:
	pass

# _process()
func update(_delta: float) -> void:
	pass

# _physics_process()
func physics_update(_delta: float) -> void:
	pass

# Initialise
func enter(_data := {}) -> void:
	pass

# Cleanup
func exit() -> void:
	pass
