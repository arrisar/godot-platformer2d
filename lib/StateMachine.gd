class_name StateMachine
extends Node

signal transitioned(name: String)
@export var initial := NodePath()
@onready var current: State = get_node(initial)

func _ready() -> void:
	await owner.ready
	current.enter()

func _unhandled_input(event: InputEvent) -> void:
	current.handle_input(event)

func _process(delta: float) -> void:
	current.update(delta)

func _physics_process(delta: float) -> void:
	current.physics_update(delta)

func transition(target: String, data: Dictionary = {}) -> void:
	var next = get_node('./' + target)
	if next == current:
		return
	
	current.exit()
	current = next
	current.enter(data)
	emit_signal("transitioned", current.name)
